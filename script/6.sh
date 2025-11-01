# Aldarion
nano /etc/dhcp/dhcpd.conf
# Ubah dari:
option domain-name-servers 192.226.3.2;

# Menjadi:
option domain-name-servers 192.226.3.2, 192.226.2.2;

service isc-dhcp-server restart

# Di client dynamic (Gilgalad/Amandil)
dhclient -r eth0
dhclient eth0

service networking restart

cat /etc/resolv.conf
# Harus muncul:
# nameserver 192.226.3.2
# nameserver 192.226.2.2

