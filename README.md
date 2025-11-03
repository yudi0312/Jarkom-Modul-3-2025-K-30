# Jarkom Modul 3 2025 K-30

| Nama                          | NRP        |
|-------------------------------|------------|
| Putu Yudi Nandanjaya Wiraguna | 5027241080 |
| Ananda Widi Alrafi            | 5027241067 |

## The Last Alliance Gathers
1. Di awal Zaman Kedua, setelah kehancuran Beleriand, para Valar menugaskan untuk membangun kembali jaringan komunikasi antar kerajaan. Para Valar menyalakan Minastir, Aldarion, Erendis, Amdir, Palantir, Narvi, Elros, Pharazon, Elendil, Isildur, Anarion, Galadriel, Celeborn, Oropher, Miriel, Amandil, Gilgalad, Celebrimbor, Khamul, dan pastikan setiap node (selain Durin sang penghubung antar dunia) dapat sementara berkomunikasi dengan Valinor/Internet (nameserver 192.168.122.1) untuk menerima instruksi awal.

  <img width="618" height="471" alt="image" src="https://github.com/user-attachments/assets/c164bd41-3b67-4684-9e72-c0e5e90ffc48" />

Konfigurasi dari topologi sebagai berikut : 

Durin
```
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
    address 192.226.1.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 192.226.2.1
    netmask 255.255.255.0

auto eth3
iface eth3 inet static
    address 192.226.3.1
    netmask 255.255.255.0

auto eth4
iface eth4 inet static
    address 192.226.4.1
    netmask 255.255.255.0

auto eth5
iface eth5 inet static
    address 192.226.5.1
    netmask 255.255.255.0

up echo 'net.ipv4.ip_forward=1' > /etc/sysctl.conf
up sysctl -p

up apt update
up apt install iptables -y
up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.226.0.0/16
```

Minastir 
```
auto eth0
iface eth0 inet static
    address 192.226.5.2
    netmask 255.255.255.0
    gateway 192.226.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Aldarion
```
auto eth0
iface eth0 inet static
    address 192.226.4.2
    netmask 255.255.255.0
    gateway 192.226.4.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Erendis
```
auto eth0
iface eth0 inet static
    address 192.226.3.2
    netmask 255.255.255.0
    gateway 192.226.3.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Amdir
```
auto eth0
iface eth0 inet static
    address 192.226.2.2
    netmask 255.255.255.0
    gateway 192.226.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Palantir
```
auto eth0
iface eth0 inet static
    address 192.226.3.3
    netmask 255.255.255.0
    gateway 192.226.3.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Narvi
```
auto eth0
iface eth0 inet static
    address 192.226.2.3
    netmask 255.255.255.0
    gateway 192.226.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Elros
```
auto eth0
iface eth0 inet static
    address 192.226.3.4
    netmask 255.255.255.0
    gateway 192.226.3.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Pharazon
```
auto eth0
iface eth0 inet static
    address 192.226.2.4
    netmask 255.255.255.0
    gateway 192.226.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Elendil
```
auto eth0
iface eth0 inet static
    address 192.226.1.2
    netmask 255.255.255.0
    gateway 192.226.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Isildur
```
auto eth0
iface eth0 inet static
    address 192.226.1.3
    netmask 255.255.255.0
    gateway 192.226.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Anarion
```
auto eth0
iface eth0 inet static
    address 192.226.1.4
    netmask 255.255.255.0
    gateway 192.226.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Galadriel
```
auto eth0
iface eth0 inet static
    address 192.226.2.5
    netmask 255.255.255.0
    gateway 192.226.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Celeborn
```
auto eth0
iface eth0 inet static
    address 192.226.2.6
    netmask 255.255.255.0
    gateway 192.226.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Oropher
```
auto eth0
iface eth0 inet static
    address 192.226.2.7
    netmask 255.255.255.0
    gateway 192.226.2.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Miriel
```
auto eth0
iface eth0 inet static
    address 192.226.1.5
    netmask 255.255.255.0
    gateway 192.226.1.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Celebrimbor
```
auto eth0
iface eth0 inet static
    address 192.226.2.8
    netmask 255.255.255.0
    gateway 192.226.2.1
    echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Gilgalad
```
auto eth0
iface eth0 inet dhcp
up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Amandil
```
auto eth0
iface eth0 inet dhcp
up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

Khamul
```
auto eth0
iface eth0 inet dhcp
up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```
Cek disemua client dengan `ping google.com -c 3`
