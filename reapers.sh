#!/bin/bash
red='\033[0;31m'
hijau='\033[1;32m'
reapers='\033[0m'
biru='\033[1;36m'

echo -en "
${biru}MASS ADMIN LOGIN FINDER
Simple Bash script to find admin login page

Coded By ./reapers
${reapers}
"
page="/administrator/login.php"

echo -ne "input list: "
read input
while IFS= read -r webnya
do
  responnya=$(curl -s -o /dev/null -w '%{http_code}' $webnya$page)
  if [ $responnya -eq 200 ]; then
    echo -e "${hijau}[+] $webnya$page [200 FOUND]"
    save=$(echo $webnya$page >> 200.txt)
  elif [ $responnya -eq 403 ]; then
    echo -e "${red}[-] $webnya$page [403 forbidden]"
    save2=$(echo $webnya$page >> 403.txt)
  else
    echo -e "${reapers}[?] $webnya$page [404 not found]"
    save3=$(echo $webnya$page >> 404.txt)
  fi
done < "$input"
