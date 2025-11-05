#Aldarion
apt-get update
apt-get install isc-dhcp-server -y

echo 'INTERFACESv4="eth0"' > /etc/default/isc-dhcp-server
echo 'INTERFACESv6=""' >> /etc/default/isc-dhcp-server

cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.backup

nano /etc/dhcp/dhcpd.conf
#Isi dengan konfigurasi berikut : 

option domain-name "k30.com";
option domain-name-servers 192.226.3.2, 192.226.3.3;

default-lease-time 1800;
max-lease-time 3600;

authoritative;

log-facility local7;

subnet 192.226.4.0 netmask 255.255.255.0 {
}

subnet 192.226.1.0 netmask 255.255.255.0 {
    range 192.226.1.6 192.226.1.34;
    range 192.226.1.68 192.226.1.94;
    option routers 192.226.1.1;
    option broadcast-address 192.226.1.255;
    option domain-name-servers 192.226.3.2;
    default-lease-time 1800;
    max-lease-time 3600;
}

subnet 192.226.2.0 netmask 255.255.255.0 {
    range 192.226.2.35 192.226.2.67;
    range 192.226.2.96 192.226.2.121;
    option routers 192.226.2.1;
    option broadcast-address 192.226.2.255;
    option domain-name-servers 192.226.3.2;
    default-lease-time 600;
    max-lease-time 3600;
}

subnet 192.226.3.0 netmask 255.255.255.0 {
    option routers 192.226.3.1;
    option broadcast-address 192.226.3.255;
    option domain-name-servers 192.226.3.2;
}

host Khamul {
    hardware ethernet 02:42:d5:1a:65:00; 
    fixed-address 192.226.3.95;
}

dhcpd -t -cf /etc/dhcp/dhcpd.conf
service isc-dhcp-server restart
service isc-dhcp-server status

#DHCP Relay Durin
apt-get update
apt-get install isc-dhcp-relay -y

nano /etc/default/isc-dhcp-relay
#Isi dengan konfigurasi berikut : 
SERVERS="192.226.4.2"

INTERFACES="eth1 eth2 eth3 eth4 eth5"

OPTIONS=""

service isc-dhcp-relay restart

echo 1 > /proc/sys/net/ipv4/ip_forward
sysctl -w net.ipv4.ip_forward=1
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

iptables -F
iptables -t nat -F
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.226.0.0/16

iptables -P FORWARD ACCEPT

cat /proc/sys/net/ipv4/ip_forward
iptables -t nat -L POSTROUTING -n -v | grep MASQUERADE

ping 8.8.8.8 -c 3

# Amandil : 192.226.1.6 - 34 atau 192.226.1.68 - 94
# Gilgalad : 192.226.2.35 - 67 atau 192.226.2.96 - 121
# Khamul : 192.226.3.95