# 시뮬레이터 바로 실행

이 폴더의 파일을 GitHub에서 열면 코드만 보입니다. 아래 링크를 누르면 브라우저에서 바로 실행됩니다.

전체 목록: https://yeonu69.github.io/DataNetwork4AI/sim/

## 1장 네트워크의 시작과 컴퓨팅 환경

- [패킷 여행](https://yeonu69.github.io/DataNetwork4AI/sim/ch01/) : 목적지에 따라 패킷이 거치는 장비와 지연 비교
- [패킷으로 쪼개 보내기](https://yeonu69.github.io/DataNetwork4AI/sim/ch01/packet.html) : 큰 파일을 패킷으로 나누면 손실에 왜 강한가
- [지연 4형제 계산기](https://yeonu69.github.io/DataNetwork4AI/sim/ch01/delay.html) : 처리·큐잉·전송·전파 지연을 직접 바꿔 보기
- [지연·손실·간섭 체험](https://yeonu69.github.io/DataNetwork4AI/sim/ch01/loss.html) : 품질 3요소가 영상 통화에 주는 영향
- [클라이언트/서버와 P2P](https://yeonu69.github.io/DataNetwork4AI/sim/ch01/cs-p2p.html) : 사용자가 늘 때 배포 시간이 어떻게 달라지나
- [Wireshark 동작 한눈에](https://yeonu69.github.io/DataNetwork4AI/sim/ch01/wireshark.html) : 캡처→필터→목록·상세·바이트 3단 보기

## 2장 네트워크 계층 모델과 데이터 캡슐화

- [캡슐화 포장](https://yeonu69.github.io/DataNetwork4AI/sim/ch02/) : 계층마다 헤더가 붙고 떼어지는 과정
- [회선 교환과 패킷 교환](https://yeonu69.github.io/DataNetwork4AI/sim/ch02/switching.html) : 전용 길을 잡을까, 나눠 쓸까
- [계층 맞히기 퀴즈](https://yeonu69.github.io/DataNetwork4AI/sim/ch02/layers.html) : 프로토콜·장비·PDU가 몇 계층인지 맞히기
- [주소 4종 세트 여행](https://yeonu69.github.io/DataNetwork4AI/sim/ch02/address.html) : 홉마다 MAC은 바뀌고 IP는 그대로인 이유
- [헤더 오버헤드와 RoCEv2](https://yeonu69.github.io/DataNetwork4AI/sim/ch02/overhead.html) : 헤더가 차지하는 비율과 GPU 통신 캡슐화

## 3장 신호 처리와 디지털 변환

- [아날로그-디지털 변환](https://yeonu69.github.io/DataNetwork4AI/sim/ch03/) : 샘플링과 양자화로 소리를 숫자로 바꾸기
- [신호의 3요소와 디지털 변조](https://yeonu69.github.io/DataNetwork4AI/sim/ch03/wave.html) : 진폭·주파수·위상과 ASK·FSK·PSK
- [나이퀴스트와 섀넌의 한계](https://yeonu69.github.io/DataNetwork4AI/sim/ch03/capacity.html) : 대역폭과 잡음이 정하는 최대 속도
- [직렬화 지연 계산기](https://yeonu69.github.io/DataNetwork4AI/sim/ch03/serial.html) : 패킷 크기와 링크 속도로 보내는 시간 구하기
- [NRZ와 PAM4 눈 모양](https://yeonu69.github.io/DataNetwork4AI/sim/ch03/pam4.html) : 한 번에 2비트 보내기와 잡음의 대가

## 4장 케이블과 무선

- [전송 매체 거리·감쇠](https://yeonu69.github.io/DataNetwork4AI/sim/ch04/) : 매체마다 신호가 약해지는 정도 비교
- [광섬유 전반사](https://yeonu69.github.io/DataNetwork4AI/sim/ch04/fiber.html) : 빛이 유리 안에 갇혀 가는 원리와 모드
- [속도·듀플렉스 협상](https://yeonu69.github.io/DataNetwork4AI/sim/ch04/autoneg.html) : 양쪽 설정이 어긋나면 생기는 일
- [2.4GHz와 5GHz](https://yeonu69.github.io/DataNetwork4AI/sim/ch04/band.html) : 거리와 벽에 따른 신호 세기와 속도
- [2.4GHz 채널 겹침](https://yeonu69.github.io/DataNetwork4AI/sim/ch04/channel24.html) : 왜 1·6·11번 채널을 쓰라고 할까

## 5장 공유 매체와 다중 접속

- [CSMA 충돌과 백오프](https://yeonu69.github.io/DataNetwork4AI/sim/ch05/) : 단말 수와 충돌, 무작위 대기
- [허브와 스위치](https://yeonu69.github.io/DataNetwork4AI/sim/ch05/hubswitch.html) : 같은 프레임이 허브와 스위치에서 어떻게 퍼지나
- [숨은 단말과 RTS/CTS](https://yeonu69.github.io/DataNetwork4AI/sim/ch05/hidden.html) : 서로 못 듣는 두 단말의 충돌 막기
- [QAM 성상도](https://yeonu69.github.io/DataNetwork4AI/sim/ch05/qam.html) : 점 개수를 늘리면 빨라지지만 잡음에 약해진다
- [다중 접속 4가지](https://yeonu69.github.io/DataNetwork4AI/sim/ch05/multiaccess.html) : FDMA·TDMA·CDMA·OFDMA로 자원 나누기
- [PFC와 ECN](https://yeonu69.github.io/DataNetwork4AI/sim/ch05/pfc.html) : 스위치 버퍼가 넘치기 전에 멈추고 알리기

## 6장 이더넷과 프레임

- [패리티와 CRC](https://yeonu69.github.io/DataNetwork4AI/sim/ch06/) : 오류 검출 방식 비교
- [MAC 주소 분석기](https://yeonu69.github.io/DataNetwork4AI/sim/ch06/mac.html) : 제조사 번호, 유니캐스트와 멀티캐스트 비트
- [이더넷 프레임 만들기](https://yeonu69.github.io/DataNetwork4AI/sim/ch06/frame.html) : 필드 크기와 패딩, 점보 프레임 효율
- [해밍 코드 오류 정정](https://yeonu69.github.io/DataNetwork4AI/sim/ch06/hamming.html) : 틀린 비트 위치를 스스로 찾아 고치기
- [토큰링](https://yeonu69.github.io/DataNetwork4AI/sim/ch06/token.html) : 토큰을 가진 사람만 말하는 규칙

## 7장 스위치와 VLAN

- [스위치 MAC 학습](https://yeonu69.github.io/DataNetwork4AI/sim/ch07/) : 플러딩, 학습, 포워딩
- [충돌·브로드캐스트 도메인](https://yeonu69.github.io/DataNetwork4AI/sim/ch07/domain.html) : 허브·스위치·라우터가 도메인을 나누는 방식
- [루프와 스패닝 트리](https://yeonu69.github.io/DataNetwork4AI/sim/ch07/stp.html) : 브로드캐스트 폭풍과 차단 포트
- [VLAN과 트렁크](https://yeonu69.github.io/DataNetwork4AI/sim/ch07/vlan.html) : 포트를 부서별로 나누고 태그 붙이기
- [리프-스파인 구조](https://yeonu69.github.io/DataNetwork4AI/sim/ch07/leafspine.html) : 트리와 그물 구조의 경로·대역폭 비교

## 8장 무선 네트워크

- [Wi-Fi 채널 배치와 로밍](https://yeonu69.github.io/DataNetwork4AI/sim/ch08/) : AP 채널과 이동 중 연결 바꾸기
- [Wi-Fi 연결 3단계](https://yeonu69.github.io/DataNetwork4AI/sim/ch08/join.html) : 스캔, 인증·연결, IP 받기
- [Wi-Fi 체감 속도](https://yeonu69.github.io/DataNetwork4AI/sim/ch08/rate.html) : 거리와 사용자 수에 따라 줄어드는 속도
- [셀룰러 핸드오버](https://yeonu69.github.io/DataNetwork4AI/sim/ch08/handover.html) : 달리는 차에서 기지국 바꾸기
- [근거리 무선 고르기](https://yeonu69.github.io/DataNetwork4AI/sim/ch08/shortrange.html) : 블루투스·NFC·지그비·Wi-Fi 비교

## 9장 IP 주소와 서브네팅

- [서브넷 계산기](https://yeonu69.github.io/DataNetwork4AI/sim/ch09/) : 주소와 프리픽스로 범위 구하기
- [2진수와 AND 연산](https://yeonu69.github.io/DataNetwork4AI/sim/ch09/binary.html) : IP 주소와 마스크를 비트로 보기
- [같은 네트워크일까?](https://yeonu69.github.io/DataNetwork4AI/sim/ch09/samenet.html) : 직접 보낼지 게이트웨이로 보낼지 판단
- [서브넷 나누기](https://yeonu69.github.io/DataNetwork4AI/sim/ch09/split.html) : /24를 클릭해서 반씩 나누기
- [VLSM 설계기](https://yeonu69.github.io/DataNetwork4AI/sim/ch09/vlsm.html) : 부서별 크기에 맞게 주소 배정

## 10장 ARP, ICMP, MTU

- [traceroute와 TTL](https://yeonu69.github.io/DataNetwork4AI/sim/ch10/) : TTL을 1씩 늘려 경로 찾기
- [ARP 요청과 캐시](https://yeonu69.github.io/DataNetwork4AI/sim/ch10/arp.html) : IP로 MAC 주소를 묻고 기억하기
- [ping 통계](https://yeonu69.github.io/DataNetwork4AI/sim/ch10/ping.html) : 손실과 지연이 ping 결과에 나타나는 모습
- [MTU와 단편화](https://yeonu69.github.io/DataNetwork4AI/sim/ch10/mtu.html) : 큰 패킷이 쪼개지는 방식과 DF 비트

## 11장 라우팅

- [최단 경로(다익스트라)](https://yeonu69.github.io/DataNetwork4AI/sim/ch11/) : 링크 비용으로 최단 경로 찾기
- [라우팅 테이블과 최장 일치](https://yeonu69.github.io/DataNetwork4AI/sim/ch11/lpm.html) : 여러 경로 중 가장 구체적인 것 고르기
- [거리 벡터(RIP)](https://yeonu69.github.io/DataNetwork4AI/sim/ch11/dv.html) : 이웃끼리 표를 주고받아 수렴하기
- [정적 vs 동적 라우팅](https://yeonu69.github.io/DataNetwork4AI/sim/ch11/failover.html) : 링크가 끊어졌을 때의 차이
- [ECMP와 코끼리 흐름](https://yeonu69.github.io/DataNetwork4AI/sim/ch11/ecmp.html) : 해시로 흐름을 나눌 때 생기는 쏠림

## 12장 DHCP, NAT, IPv6

- [NAT 변환 표](https://yeonu69.github.io/DataNetwork4AI/sim/ch12/) : 사설 주소와 포트를 바꿔 나가기
- [DHCP DORA와 임대](https://yeonu69.github.io/DataNetwork4AI/sim/ch12/dhcp.html) : 주소를 빌리고 갱신하는 대화
- [포트 포워딩](https://yeonu69.github.io/DataNetwork4AI/sim/ch12/portfwd.html) : 밖에서 안으로 들어오는 길 열기
- [IPv6 주소 줄이기](https://yeonu69.github.io/DataNetwork4AI/sim/ch12/ipv6.html) : 0 생략과 :: 규칙 연습

## 13장 전송 계층

- [TCP 혼잡 제어](https://yeonu69.github.io/DataNetwork4AI/sim/ch13/) : 느린 시작, 혼잡 회피, 손실 대응
- [포트와 소켓](https://yeonu69.github.io/DataNetwork4AI/sim/ch13/ports.html) : 도착한 세그먼트를 프로그램에 나눠 주기
- [소켓 프로그래밍 모의실습](https://yeonu69.github.io/DataNetwork4AI/sim/ch13/socket.html) : socket·bind·listen·accept·connect·send·recv 단계별 실행
- [UDP와 TCP 비교](https://yeonu69.github.io/DataNetwork4AI/sim/ch13/udptcp.html) : 손실이 있을 때 두 프로토콜의 차이
- [3-way와 4-way](https://yeonu69.github.io/DataNetwork4AI/sim/ch13/handshake.html) : 순서 번호와 플래그 주고받기
- [ARQ 3가지](https://yeonu69.github.io/DataNetwork4AI/sim/ch13/arq.html) : 정지-대기, Go-Back-N, 선택적 재전송
- [슬라이딩 윈도와 흐름 제어](https://yeonu69.github.io/DataNetwork4AI/sim/ch13/window.html) : 받는 쪽 버퍼에 맞춰 속도 조절
- [꼬리 지연](https://yeonu69.github.io/DataNetwork4AI/sim/ch13/tail.html) : 가장 느린 GPU 하나가 전체를 기다리게 한다

## 14장 응용 서비스와 보안

- [DNS 이름 풀이](https://yeonu69.github.io/DataNetwork4AI/sim/ch14/) : 재귀·반복 질의와 캐시
- [HTTP 요청과 응답](https://yeonu69.github.io/DataNetwork4AI/sim/ch14/http.html) : 메서드, 상태 코드, 캐시
- [HTTPS가 숨기는 것](https://yeonu69.github.io/DataNetwork4AI/sim/ch14/tls.html) : 도청자 눈에 보이는 것과 안 보이는 것
- [암호의 기초](https://yeonu69.github.io/DataNetwork4AI/sim/ch14/crypto.html) : 대칭키, 공개키, 해시를 손으로 해 보기
- [방화벽 규칙](https://yeonu69.github.io/DataNetwork4AI/sim/ch14/firewall.html) : 위에서부터 처음 맞는 규칙 적용
- [로드밸런싱](https://yeonu69.github.io/DataNetwork4AI/sim/ch14/lb.html) : AI 요청을 GPU 서버에 나눠 주기

## 15장 AI 시대의 네트워크

- [링 올리듀스](https://yeonu69.github.io/DataNetwork4AI/sim/ch15/) : GPU가 기울기를 나눠 더하는 방법
- [비차단 설계 계산기](https://yeonu69.github.io/DataNetwork4AI/sim/ch15/oversub.html) : 리프-스파인의 오버서브스크립션
- [레일 최적화](https://yeonu69.github.io/DataNetwork4AI/sim/ch15/rail.html) : 같은 번호 GPU끼리 같은 길로
- [장애는 일상이다](https://yeonu69.github.io/DataNetwork4AI/sim/ch15/failure.html) : GPU 수와 고장, 체크포인트
- [AI는 어디서 실행될까](https://yeonu69.github.io/DataNetwork4AI/sim/ch15/where.html) : 클라우드·엣지·온디바이스 비교
