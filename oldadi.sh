#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "Harap Menggunakan User ROOT"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "VPS OpenVZ Tidak Didukung"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Authentikasi pada server"
IZIN=$( curl -s https://raw.githubusercontent.com/TeknisiIT1/KIKO1/main/register.txt | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permintaan Diterima...${NC}"
else
echo -e "${red}Permintaan Ditolak!${NC}";
echo "Hanya untuk pengguna terdaftar"
rm -f setup.sh
rm -f adi.sh
exit 0
fi
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl wget && wget -q #!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "Harap Menggunakan User ROOT"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(curl -4 -k -sS ip.sb);
echo "Authentikasi pada server"
IZIN=$( curl -s https://raw.githubusercontent.com/TeknisiIT1/KIKO1/main/register.txt | grep -w $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permintaan Diterima...${NC}"
else
echo -e "${red}Permintaan Ditolak!${NC}";
echo "Hanya untuk pengguna terdaftar"
rm -f setup.sh
rm -f adi.sh
exit 0
fi
#sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && 
apt update && apt install -y bzip2 gzip coreutils screen curl wget && wget -q https://surgahostinganaswae.com/SC/kiko1/setup.sh && chmod +x setup.sh && ./setup.sh/setup.sh && chmod +x setup.sh && ./setup.sh
