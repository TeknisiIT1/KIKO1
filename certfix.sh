#!/bin/bash                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         #!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
IZIN=$( curl -s https://raw.githubusercontent.com/TeknisiIT1/KIKO1/main/register.txt | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Only For Premium Users"
exit 0
fi
clear

# PKG
apt update && upgrade
apt install git -y

# Remove Necesarry Files
rm -f /etc/adi/adi.crt
rm -f /etc/adi/adi.key
rm -f /etc/adi/domain
rm -f /root/domain

# Command
echo "Masukan Domain Baru Kamu"
read -p "Hostname / Domain: " host
echo "$host" >> /etc/adi/domain
echo "$host" >> /root/domain

# ENV
domain=$(cat /root/domain)

# Clone Acme
git clone https://github.com/acmesh-official/acme.sh.git /etc/acme
cd /etc/acme
systemctl stop nginx
systemctl stop xray@vmesswsnontls
chmod +x acme.sh
./acme.sh --register-account -m netz@$domain
./acme.sh --issue -d $domain --standalone
./acme.sh --installcert -d $domain --key-file /etc/adi/adi.key --fullchain-file /etc/adi/adi.crt

# Restart Service
rm -f /root/domain
systemctl restart nginx
systemctl restart xray@vmesswsnontls
echo "Domain Telah Diperbarui & Sertifikasi Selesai"
