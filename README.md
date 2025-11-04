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

<img width="1212" height="202" alt="image" src="https://github.com/user-attachments/assets/a7ac1712-b904-47e7-9fb2-b12bf7c521b4" />

2. Raja Pelaut Aldarion, penguasa wilayah Númenor, memutuskan cara pembagian tanah client secara dinamis. Ia menetapkan:
- Client Dinamis Keluarga Manusia: Mendapatkan tanah di rentang [prefix ip].1.6 - [prefix ip].1.34 dan [prefix ip].1.68 - [prefix ip].1.94.
- Client Dinamis Keluarga Peri: Mendapatkan tanah di rentang [prefix ip].2.35 - [prefix ip].2.67 dan [prefix ip].2.96 - [prefix ip].2.121.
- Khamul yang misterius: Diberikan tanah tetap di [prefix ip].3.95, agar keberadaannya selalu diketahui. Pastikan Durin dapat menyampaikan dekrit ini ke semua wilayah yang terhubung dengannya.

Jalankan script berikut di **Durin** untuk menginstal layanan DHCP Relay :
```
apt-get update
apt-get install isc-dhcp-relay -y
```

Edit bagian `/etc/default/isc-dhcp-relay` dengan konfig berikut : 
```
SERVERS="192.226.4.2"

INTERFACES="eth1 eth2 eth3 eth4 eth5"

OPTIONS=""
```

Jalankan `service isc-dhcp-relay restart` , `echo 1 > /proc/sys/net/ipv4/ip_forward` untuk mengaktifkan penerusan paket (routing) antar interface Durin secara runtime, `sysctl -w net.ipv4.ip_forward=1` untuk memastikan forwarding aktif `iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.226.0.0/16` untuk mengaktifkan Network Address Translation (NAT) di interface eth0 (ke Internet) untuk semua paket yang berasal dari seluruh jaringan 192.226.x.x.

Selanjutnya jalankan script berikut di Aldarion sebagai DHCP Server : 

`apt-get install isc-dhcp-server -y`	untuk menginstal layanan DHCP Server dan `echo 'INTERFACESv4="eth0"' > /etc/default/isc-dhcp-server`	untuk menetapkan Aldarion mendengarkan di eth0. Edit bagian `/etc/dhcp/dhcpd.conf` dengan konfigurasi berikut ini : 
```
option domain-name "k30.com";
option domain-name-servers 192.226.3.2;

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
    hardware ethernet 02:42:c3:47:30:00;  # MAC Address Khamul
    fixed-address 192.226.3.95;
}
```

Jalankan `dhcpd -t -cf /etc/dhcp/dhcpd.conf` dan `service isc-dhcp-server restart`, setelah Durin dan Aldarion aktif, klien dinamis menjalankan dhclient untuk mendapatkan IP.

- Gilgalad (Peri, $192.226.2.x$) : Gilgalad berhasil mendapatkan alamat IP di rentang Peri, dengan waktu sewa yang singkat.Hasil yang diharapkan (ip a / dhclient) :
  - IP Address: Dalam rentang $192.226.2.35 - 2.67$ atau $192.226.2.96 - 2.121$
  - Renewal/Lease Time: Sekitar $600$ detik (10 menit).
    <img width="942" height="667" alt="image" src="https://github.com/user-attachments/assets/769b2d31-87a0-4a80-ab37-b669ee15faad" />

- Amandil (Manusia, $192.226.1.x$) : Amandil berhasil mendapatkan alamat IP di rentang Manusia.
  - Hasil yang diharapkan (ip a / dhclient) adalah IP Address: Dalam rentang $192.226.1.6 - 1.34$ atau $192.226.1.68 - 1.94$
  - Renewal/Lease Time: Sekitar $1800$ detik (30 menit).
    <img width="927" height="767" alt="image" src="https://github.com/user-attachments/assets/7010a39c-ca2d-4723-9cec-c442dc79bf41" />

- Khamul (Fixed Address, $192.226.3.95$) : Khamul berhasil mendapatkan alamat IP tetap berdasarkan MAC Address yang telah didaftarkan.Hasil yang diharapkan (ip a / dhclient)
  - IP Address: Tepat $192.226.3.95/24$
    <img width="933" height="726" alt="image" src="https://github.com/user-attachments/assets/c0f183bf-e469-4831-bf3f-1cf48348c0f7" />

- Verifikasi Konektivitas Internet : Setiap klien dapat terhubung ke Internet karena Durin mengaktifkan NAT. Contoh verifikasi dari Amandil/Gilgalad/Khamul : `ping 8.8.8.8 -c 3`

3. Untuk mengontrol arus informasi ke dunia luar (Valinor/Internet), sebuah menara pengawas, Minastir didirikan. Minastir mengatur agar semua node (kecuali Durin) hanya dapat mengirim pesan ke luar Arda setelah melewati pemeriksaan di Minastir.

Jalankan script `apt-get update && apt-get install bind9 bind9utils dnsutils -y` dan edit bagian `/etc/bind/named.conf.options` : 

```
options {
    directory "/var/cache/bind";
    forwarders {
        192.168.122.1; 
    };

    allow-query { any; };

    forward only;

    listen-on { any; };
    listen-on-v6 { any; };

    dnssec-validation no;

    recursion yes;
};
```

Jalankan `service named restart` dan update resolver semua node (kecuali Durin) untuk menggunakan Minastir, contoh di Gilgalad `echo "nameserver 192.226.5.2" > /etc/resolv.conf` dan test dengan `dig google.com` & `dig elros.k30.com`

<img width="752" height="908" alt="image" src="https://github.com/user-attachments/assets/4467343f-4c80-4691-bdf1-ec3d151596d9" />

4. Ratu Erendis, sang pembuat peta, menetapkan nama resmi untuk wilayah utama (<xxxx>.com). Ia menunjuk dirinya (ns1.<xxxx>.com) dan muridnya Amdir (ns2.<xxxx>.com) sebagai penjaga peta resmi. Setiap lokasi penting (Palantir, Elros, Pharazon, Elendil, Isildur, Anarion, Galadriel, Celeborn, Oropher) diberikan nama domain unik yang menunjuk ke lokasi fisik tanah mereka. Pastikan Amdir selalu menyalin peta (master-slave) dari Erendis dengan setia.

Installl bind9 dengan script berikut pada Erendis `apt-get update && apt-get install bind9 bind9utils dnsutils -y` dan edit bagian `/etc/bind/named.conf.local` : 
```
zone "k30.com" {
    type master;
    file "/etc/bind/jarkom/k30.com";
    allow-transfer { 192.226.2.2; }; 
    also-notify { 192.226.2.2; };    
};

zone "3.226.192.in-addr.arpa" {
    type master;
    file "/etc/bind/jarkom/3.226.192.in-addr.arpa";
    allow-transfer { 192.226.2.2; }; 
    also-notify { 192.226.2.2; };
};

zone "2.226.192.in-addr.arpa" {
    type master;
    file "/etc/bind/jarkom/2.226.192.in-addr.arpa";
    allow-transfer { 192.226.2.2; }; 
    also-notify { 192.226.2.2; };
};
```

Buat sebuah folder `mkdir -p /etc/bind/jarkom` dan edit file `/etc/bind/jarkom/k30.com` dengan konfigurasi berikut : 
```
;
; BIND data file for k30.com
;
$TTL    604800
@       IN      SOA     k30.com. root.k30.com. (
                        2024103101      ; Serial (YYYYMMDDNN)
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
; Name servers
@               IN      NS      ns1.k30.com.
@               IN      NS      ns2.k30.com.

; A records for name servers
ns1             IN      A       192.226.3.2   ; Erendis
ns2             IN      A       192.226.2.2   ; Amdir

; Alias untuk domain utama
@               IN      A       192.226.3.2   ; k30.com -> Erendis
www             IN      CNAME   k30.com.      ; www.k30.com -> k30.com

; A records untuk semua node penting
palantir        IN      A       192.226.3.3   ; Palantir (Database Server)
elros           IN      A       192.226.3.4   ; Elros (LB Laravel)
pharazon        IN      A       192.226.2.4   ; Pharazon (LB PHP)

; Laravel Workers (Keluarga Manusia)
elendil         IN      A       192.226.1.2   ; Elendil (Laravel Worker-1)
isildur         IN      A       192.226.1.3   ; Isildur (Laravel Worker-2)
anarion         IN      A       192.226.1.4   ; Anarion (Laravel Worker-3)

; PHP Workers (Keluarga Peri)
galadriel       IN      A       192.226.2.5   ; Galadriel (PHP Worker-1)
celeborn        IN      A       192.226.2.6   ; Celeborn (PHP Worker-2)
oropher         IN      A       192.226.2.7   ; Oropher (PHP Worker-3)

; TXT Records (Pesan Rahasia)
elros           IN      TXT     "Cincin Sauron"
pharazon        IN      TXT     "Aliansi Terakhir"
```

Buat reverse zone untuk 192.226.3.0/24 `nano /etc/bind/jarkom/3.226.192.in-addr.arpa` dengan isi konfigurasi berikut : 
```
;
; BIND reverse data file for 192.226.3.0/24
;
$TTL    604800
@       IN      SOA     k30.com. root.k30.com. (
                        2024103101      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
; Name servers
@       IN      NS      ns1.k30.com.
@       IN      NS      ns2.k30.com.

; PTR records
2       IN      PTR     ns1.k30.com.        ; 192.226.3.2 -> Erendis
3       IN      PTR     palantir.k30.com.   ; 192.226.3.3 -> Palantir
4       IN      PTR     elros.k30.com.      ; 192.226.3.4 -> Elros
```

Buat reverse zone untuk 192.226.2.0/24 `nano /etc/bind/jarkom/2.226.192.in-addr.arpa` isi dengan konfigurasi berikut : 
```
;
; BIND reverse data file for 192.226.2.0/24
;
$TTL    604800
@       IN      SOA     k30.com. root.k30.com. (
                        2024103101      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
; Name servers
@       IN      NS      ns1.k30.com.
@       IN      NS      ns2.k30.com.

; PTR records
2       IN      PTR     ns2.k30.com.        ; 192.226.2.2 -> Amdir
4       IN      PTR     pharazon.k30.com.   ; 192.226.2.4 -> Pharazon
5       IN      PTR     galadriel.k30.com.  ; 192.226.2.5 -> Galadriel
6       IN      PTR     celeborn.k30.com.   ; 192.226.2.6 -> Celeborn
7       IN      PTR     oropher.k30.com.    ; 192.226.2.7 -> Oropher
```
Lalu edit bagian `/etc/bind/named.conf.options` dengan konfigurasi berikut : 
```
options {
    directory "/var/cache/bind";

    # Allow query dari semua
    allow-query { any; };

    # Allow transfer hanya ke Amdir (slave)
    allow-transfer { 192.226.2.2; };

    # Listening
    listen-on { any; };
    listen-on-v6 { any; };

    # Allow recursion
    recursion yes;

    # Forwarders (opsional, untuk query di luar zone)
    forwarders {
        192.168.122.1;
    };

    # DNSSEC
    dnssec-validation no;
};
```
Perintah named-checkzone digunakan untuk memverifikasi sintaks dan integritas dari zone file BIND DNS sebelum zone tersebut dimuat atau digunakan : 
```
named-checkzone k30.com /etc/bind/jarkom/k30.com
named-checkzone 3.226.192.in-addr.arpa /etc/bind/jarkom/3.226.192.in-addr.arpa
named-checkzone 2.226.192.in-addr.arpa /etc/bind/jarkom/2.226.192.in-addr.arpa
named-checkconf
```

Restart dari bind9 menggunakan `service named restart`. Test dari client manapun dan update nameserver ke Erendis `echo "nameserver 192.226.3.2" > /etc/resolv.conf`. Test A records : 

<img width="848" height="647" alt="image" src="https://github.com/user-attachments/assets/e61443fe-2dc3-4348-9862-89fa0ac77c8a" />

<img width="978" height="921" alt="image" src="https://github.com/user-attachments/assets/92ae1524-2b13-45c7-a671-70ec80121d8b" />

5. Untuk memudahkan, nama alias www.<xxxx>.com dibuat untuk peta utama <xxxx>.com. Reverse PTR juga dibuat agar lokasi Erendis dan Amdir dapat dilacak dari alamat fisik tanahnya. Erendis juga menambahkan pesan rahasia (TXT record) pada petanya: "Cincin Sauron" yang menunjuk ke lokasi Elros, dan "Aliansi Terakhir" yang menunjuk ke lokasi Pharazon. Pastikan Amdir juga mengetahui pesan rahasia ini.








