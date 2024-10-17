#!/bin/bash
echo "=================================="
echo "====== 네트워크 테스트 실시 ======"
echo "=================================="

cat << EOF > ip_list.txt
168.126.63.1
www.google.com
EOF

sleep 3
printf "\n"
cat ip_list.txt | while read IP_ADDRESS
do
    ping -c 1 -W 1 "$IP_ADDRESS" > /dev/null
    if [ $? -eq 0 ]; then
    echo "\"$IP_ADDRESS\" 으로 통신이 가능합니다."
    else
    echo "\"$IP_ADDRESS\" 으로 통신이 불가능합니다."
    fi
done

printf "\n"
printf "①  네트워크 통신이 불가능하다면, nm-connection-editor & 을 실행하여 IP 주소 설정 내용을 검토 및 수정합니다.\n"
printf "②  검토 및 수정이 완료되었다면, nmcli connection up ens33 && systemctl restart NetworkManager 를 실행합니다.\n"
printf "③  sh ping.sh 를 실행하여 네트워크 통신 테스트를 다시 시작합니다.\n"
printf "④  네트워크 통신이 가능하다면, sh setup.sh 를 실행하여 CentOS 기본 환경 구성을 시작합니다.\n"
printf "\n"
