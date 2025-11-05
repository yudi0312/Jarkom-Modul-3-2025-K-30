#Erendis
apt-get update
apt-get install bind9 bind9utils dnsutils -y

nano /etc/bind/named.conf.local
#Isi dengan konfigurasi berikut : 

zone "k30.com" {
    type master;
    file "/etc/bind/jarkom/k30.com";
    allow-transfer { 192.226.3.3; };  
    also-notify { 192.226.3.3; };
};

zone "3.226.192.in-addr.arpa" {
    type master;
    file "/etc/bind/jarkom/3.226.192.in-addr.arpa";
    allow-transfer { 192.226.3.3; };
    also-notify { 192.226.3.3; };
};

zone "2.226.192.in-addr.arpa" {
    type master;
    file "/etc/bind/jarkom/2.226.192.in-addr.arpa";
    allow-transfer { 192.226.3.3; };
    also-notify { 192.226.3.3; };
};

zone "1.226.192.in-addr.arpa" {
    type master;
    file "/etc/bind/jarkom/1.226.192.in-addr.arpa";
    allow-transfer { 192.226.3.3; };
    also-notify { 192.226.3.3; };
};

zone "4.226.192.in-addr.arpa" {
    type master;
    file "/etc/bind/jarkom/4.226.192.in-addr.arpa";
    allow-transfer { 192.226.3.3; };
    also-notify { 192.226.3.3; };
};

mkdir -p /etc/bind/jarkom
nano /etc/bind/jarkom/k30.com
# Isi dengan konfigurasi berikut
;
; BIND data file for k30.com
;
$TTL    604800
@       IN      SOA     k30.com. root.k30.com. (
                        2024110301      ; Serial (YYYYMMDDNN)
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
ns2             IN      A       192.226.3.3   ; Amdir

; Alias untuk domain utama
@               IN      A       192.226.3.2   ; k30.com -> Erendis
www             IN      CNAME   k30.com.      ; www.k30.com -> k30.com

; A records untuk semua node penting
minastir        IN      A       192.226.5.2   ; Minastir (DNS Forwarder)
aldarion        IN      A       192.226.4.2   ; Aldarion (DHCP Server)
erendis         IN      A       192.226.3.2   ; Erendis (DNS Master)
amdir           IN      A       192.226.3.3   ; Amdir (DNS Slave)
palantir        IN      A       192.226.4.3   ; Palantir (Database Server)
narvi           IN      A       192.226.4.4   ; Narvi (Database Slave)
elros           IN      A       192.226.1.6   ; Elros (LB Laravel)
pharazon        IN      A       192.226.2.2   ; Pharazon (LB PHP)

; Laravel Workers (Keluarga Manusia)
elendil         IN      A       192.226.1.2   ; Elendil (Laravel Worker-1)
isildur         IN      A       192.226.1.3   ; Isildur (Laravel Worker-2)
anarion         IN      A       192.226.1.4   ; Anarion (Laravel Worker-3)

; PHP Workers (Keluarga Peri)
galadriel       IN      A       192.226.2.6   ; Galadriel (PHP Worker-1)
celeborn        IN      A       192.226.2.5   ; Celeborn (PHP Worker-2)
oropher         IN      A       192.226.2.4   ; Oropher (PHP Worker-3)

; Clients
miriel          IN      A       192.226.1.5   ; Miriel (Client-Static-1)
celebrimbor     IN      A       192.226.2.3   ; Celebrimbor (Client-Static-2)

; TXT Records (Pesan Rahasia)
elros           IN      TXT     "Cincin Sauron"
pharazon        IN      TXT     "Aliansi Terakhir"

# Buat reverse zone untuk 192.226.1.0/24 :
nano /etc/bind/jarkom/1.226.192.in-addr.arpa
#Isi dengan konfigurasi berikut : 
;
; BIND reverse data file for 192.226.1.0/24
;
$TTL    604800
@       IN      SOA     k30.com. root.k30.com. (
                        2024110301      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
; Name servers
@       IN      NS      ns1.k30.com.
@       IN      NS      ns2.k30.com.

; PTR records
2       IN      PTR     elendil.k30.com.    ; 192.226.1.2
3       IN      PTR     isildur.k30.com.    ; 192.226.1.3
4       IN      PTR     anarion.k30.com.    ; 192.226.1.4
5       IN      PTR     miriel.k30.com.     ; 192.226.1.5
6       IN      PTR     elros.k30.com.      ; 192.226.1.6

# Buat reverse zone untuk 192.226.2.0/24:
nano /etc/bind/jarkom/2.226.192.in-addr.arpa
# Isi dengan konfigurasi berikut : 
;
; BIND reverse data file for 192.226.2.0/24
;
$TTL    604800
@       IN      SOA     k30.com. root.k30.com. (
                        2024110301      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
; Name servers
@       IN      NS      ns1.k30.com.
@       IN      NS      ns2.k30.com.

; PTR records
2       IN      PTR     pharazon.k30.com.     ; 192.226.2.2
3       IN      PTR     celebrimbor.k30.com.  ; 192.226.2.3
4       IN      PTR     oropher.k30.com.      ; 192.226.2.4
5       IN      PTR     celeborn.k30.com.     ; 192.226.2.5
6       IN      PTR     galadriel.k30.com.    ; 192.226.2.6

# Buat reverse zone untuk 192.226.3.0/24
nano /etc/bind/jarkom/3.226.192.in-addr.arpa
# Isi dengan konfigurasi dibawah ini : 
;
; BIND reverse data file for 192.226.3.0/24
;
$TTL    604800
@       IN      SOA     k30.com. root.k30.com. (
                        2024110301      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
; Name servers
@       IN      NS      ns1.k30.com.
@       IN      NS      ns2.k30.com.

; PTR records
2       IN      PTR     ns1.k30.com.        ; 192.226.3.2 - Erendis
3       IN      PTR     ns2.k30.com.        ; 192.226.3.3 - Amdir

# Buat reverse zone untuk 192.226.4.0/24
nano /etc/bind/jarkom/4.226.192.in-addr.arpa
# Isi dengan konfigurasi dibawah ini : 
;
; BIND reverse data file for 192.226.4.0/24
;
$TTL    604800
@       IN      SOA     k30.com. root.k30.com. (
                        2024110301      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
; Name servers
@       IN      NS      ns1.k30.com.
@       IN      NS      ns2.k30.com.

; PTR records
2       IN      PTR     aldarion.k30.com.   ; 192.226.4.2
3       IN      PTR     palantir.k30.com.   ; 192.226.4.3
4       IN      PTR     narvi.k30.com.      ; 192.226.4.4


nano /etc/bind/named.conf.options
# Isi dengan konfigurasi berikut : 
options {
    directory "/var/cache/bind";

    # Allow query dari semua
    allow-query { any; };

    # Allow transfer hanya ke Amdir (slave)
    allow-transfer { 192.226.3.3; };

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

# Cek syntax zone files
named-checkzone k30.com /etc/bind/jarkom/k30.com
named-checkzone 1.226.192.in-addr.arpa /etc/bind/jarkom/1.226.192.in-addr.arpa
named-checkzone 2.226.192.in-addr.arpa /etc/bind/jarkom/2.226.192.in-addr.arpa
named-checkzone 3.226.192.in-addr.arpa /etc/bind/jarkom/3.226.192.in-addr.arpa
named-checkzone 4.226.192.in-addr.arpa /etc/bind/jarkom/4.226.192.in-addr.arpa
named-checkconf



#Test dari client manapun 
echo "nameserver 192.226.3.2" > /etc/resolv.conf
dig elros.k30.com
dig pharazon.k30.com
dig elendil.k30.com
dig palantir.k30.com

