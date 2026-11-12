#!/bin/bash
W=/tmp/claude-0/ws; C=$W/cap; mkdir -p $C
N="env -u HTTP_PROXY -u HTTPS_PROXY -u http_proxy -u https_proxy"
cap(){ # name ns iface dur
  ip netns exec $2 tshark -q -i $3 -w $C/$1.pcapng -a duration:$4 >/dev/null 2>&1 & sleep 1.2; }
flush(){ for n in pc1 pc2 r1; do ip -n $n neigh flush all; done; }
# 1장: 웹 접속 한 번(DNS·TCP·HTTP·TLS가 섞인 첫 캡처)
flush; cap c01_first pc1 eth0 6; ip netns exec pc1 dig www.example.com >/dev/null; $N ip netns exec pc1 curl -s http://www.example.com/ >/dev/null; $N ip netns exec pc1 curl -sk https://www.example.com/ >/dev/null; ip netns exec pc1 ping -c 2 -s 32 8.8.8.8 >/dev/null; wait
# 2장: nslookup 한 번
ip netns exec pc1 ping -c1 192.168.0.1 >/dev/null; cap c02_dns pc1 eth0 3; ip netns exec pc1 nslookup www.example.com >/dev/null; wait
# 3장: 큰 파일 내려받기
cap c03_size pc1 eth0 4; $N ip netns exec pc1 curl -s http://www.example.com/big.txt >/dev/null 2>&1; wait
# 6장: ARP 캐시 비우고 게이트웨이 ping, 그다음 8.8.8.8 ping
flush; cap c06_arp pc1 eth0 7; ip netns exec pc1 ping -c 4 -s 32 192.168.0.1 >/dev/null; ip netns exec pc1 ping -c 2 -s 32 8.8.8.8 >/dev/null; wait
# 7장: pc2에서 본 브로드캐스트(pc1의 ARP + pc2 자신의 DHCP Discover)
flush; cap c07_bcast pc2 eth0 6; ip netns exec pc1 ping -c 2 192.168.0.1 >/dev/null; ip netns exec pc1 arping -c 1 -I eth0 192.168.0.50 >/dev/null 2>&1; ip netns exec pc1 ping -c 1 -b 192.168.0.255 >/dev/null 2>&1; wait
# 10장: ARP 비우고 ping 4회 / tracert -h 5
flush; cap c10_ping pc1 eth0 7; ip netns exec pc1 ping -c 4 -s 32 192.168.0.1 >/dev/null; wait
cap c10_trace pc1 eth0 6; ip netns exec pc1 traceroute -I -n -m 5 -q 3 8.8.8.8 >/dev/null; wait
# 12장: DHCP release → DORA
ip -n pc1 addr flush dev eth0; ip -n pc1 link set eth0 up
ip netns exec pc1 dhclient -v -1 -sf /bin/true -pf $W/dhc.pid -lf $W/dhc.leases eth0 >/dev/null 2>&1
ip -n pc1 addr add 192.168.0.23/24 dev eth0 2>/dev/null
cap c12_dhcp pc1 eth0 9; ip netns exec pc1 dhclient -r -sf /bin/true -pf $W/dhc.pid -lf $W/dhc.leases eth0 >/dev/null 2>&1; ip -n pc1 addr flush dev eth0; sleep 1; ip netns exec pc1 dhclient -v -1 -sf /bin/true -pf $W/dhc.pid -lf $W/dhc.leases eth0 >/dev/null 2>&1; wait
ip netns exec pc1 dhclient -x -pf $W/dhc.pid >/dev/null 2>&1; ip -n pc1 addr flush dev eth0; ip -n pc1 addr add 192.168.0.23/24 dev eth0; ip -n pc1 route add default via 192.168.0.1 2>/dev/null
# 13장: https 접속(핸드셰이크~종료)
cap c13_tcp pc1 eth0 5; $N ip netns exec pc1 curl -sk https://www.example.com/ >/dev/null; wait
# 14장: DNS(CNAME), HTTP 8000, HTTPS SNI
cap c14_dns pc1 eth0 3; ip netns exec pc1 nslookup www.test.com >/dev/null; wait
(cd $W/www8000 && ip netns exec pc1 python3 -m http.server 8000 --bind 192.168.0.23 >/dev/null 2>&1 &) ; sleep 1
cap c14_http pc1 eth0 4; $N ip netns exec pc2 curl -s http://192.168.0.23:8000/ >/dev/null; wait; pkill -f "http.server 8000"
cap c14_tls pc1 eth0 4; $N ip netns exec pc1 curl -sk https://www.example.com/ >/dev/null; wait
ls -la $C
