# Aldarion
nano /etc/dhcp/dhcpd.conf
# Ubah dari:
option domain-name-servers 192.226.3.2;

# Menjadi:
option domain-name-servers 192.226.3.2, 192.226.3.3;

service isc-dhcp-server restart

# Di client dynamic (Gilgalad/Amandil)
apt update
apt install -y isc-dhcp-client

dhclient -r eth0
dhclient -v eth0
    
service networking restart

# Di aldarion

cat /var/lib/dhcp/dhcpd.leases


