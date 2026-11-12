#!/bin/bash
# 가상 실습망: pc1, pc2 --(sw: br0)-- r1(공유기 192.168.0.1) -- r2 -- r3 -- srv(DNS 168.126.63.1, 웹 93.184.215.14, 8.8.8.8)
set -e
for n in pc1 pc2 sw r1 r2 r3 srv; do ip netns del $n 2>/dev/null || true; ip netns add $n; ip -n $n link set lo up; done
link(){ ip link add $1 netns $2 type veth peer name $3 netns $4; }
link eth0 pc1 p1 sw; link eth0 pc2 p2 sw; link lan r1 p3 sw
ip -n sw link add br0 type bridge; for p in p1 p2 p3; do ip -n sw link set $p master br0; ip -n sw link set $p up; done; ip -n sw link set br0 up
link wan r1 eth1 r2; link eth2 r2 eth1 r3; link eth2 r3 eth0 srv
ip -n pc1 link set eth0 address 3c:9c:0f:12:ab:cd; ip -n pc2 link set eth0 address 3c:9c:0f:34:56:78
ip -n r1 link set lan address 88:36:6c:aa:bb:cc
ip -n pc1 addr add 192.168.0.23/24 dev eth0; ip -n pc2 addr add 192.168.0.50/24 dev eth0
ip -n r1 addr add 192.168.0.1/24 dev lan; ip -n r1 addr add 10.0.12.1/30 dev wan
ip -n r2 addr add 10.0.12.2/30 dev eth1; ip -n r2 addr add 10.0.23.1/30 dev eth2
ip -n r3 addr add 10.0.23.2/30 dev eth1; ip -n r3 addr add 203.0.113.1/24 dev eth2
ip -n srv addr add 203.0.113.10/24 dev eth0
for a in 168.126.63.1 93.184.215.14 8.8.8.8; do ip -n srv addr add $a/32 dev eth0; done
for i in "pc1 eth0" "pc2 eth0" "r1 lan" "r1 wan" "r2 eth1" "r2 eth2" "r3 eth1" "r3 eth2" "srv eth0"; do set -- $i; ip -n $1 link set $2 up; ip netns exec $1 ethtool -K $2 tso off gso off gro off tx off >/dev/null 2>&1 || true; done
for r in r1 r2 r3; do ip netns exec $r sysctl -qw net.ipv4.ip_forward=1; done
for p in pc1 pc2; do ip -n $p route add default via 192.168.0.1; ip netns exec $p sysctl -qw net.ipv4.ip_default_ttl=128; done
ip -n r1 route add default via 10.0.12.2
ip -n r2 route add 192.168.0.0/24 via 10.0.12.1; ip -n r2 route add default via 10.0.23.2
ip -n r3 route add default via 10.0.23.1
for a in 168.126.63.1 93.184.215.14 8.8.8.8; do ip -n r3 route add $a/32 via 203.0.113.10; done
ip -n srv route add default via 203.0.113.1
echo lab up
