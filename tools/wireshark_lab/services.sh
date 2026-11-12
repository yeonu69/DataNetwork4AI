#!/bin/bash
pkill -f "http.server" ; pkill -f https.py; pkill dnsmasq; sleep 0.5
W=/tmp/claude-0/ws
cd $W/www && ip netns exec srv nohup python3 -m http.server 80 --bind 93.184.215.14 >$W/http.log 2>&1 &
ip netns exec srv nohup python3 $W/https.py >$W/https.log 2>&1 &
ip netns exec srv dnsmasq --no-resolv --no-hosts --listen-address=168.126.63.1 --bind-interfaces --pid-file=$W/dns.pid \
  --host-record=www.example.com,93.184.215.14 --host-record=web.test.com,93.184.215.14 --cname=www.test.com,web.test.com --local-ttl=300 --log-facility=$W/dns.log
ip netns exec r1 dnsmasq --port=0 --interface=lan --bind-interfaces --pid-file=$W/dhcp.pid \
  --dhcp-range=192.168.0.100,192.168.0.150,255.255.255.0,24h --dhcp-host=3c:9c:0f:12:ab:cd,192.168.0.23 \
  --dhcp-option=3,192.168.0.1 --dhcp-option=6,192.168.0.1 --dhcp-leasefile=$W/leases --log-facility=$W/dhcp.log
mkdir -p /etc/netns/pc1 /etc/netns/pc2; echo "nameserver 168.126.63.1" > /etc/netns/pc1/resolv.conf; cp /etc/netns/pc1/resolv.conf /etc/netns/pc2/
sleep 1; echo services up
