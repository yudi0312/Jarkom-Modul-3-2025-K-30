#Minastir
apt-get update
apt-get install bind9 bind9utils dnsutils -y

nano /etc/bind/named.conf.options
#Isi dengan konfigurasi berikut : 
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

service named restart
#Update resolver semua node (kecuali Durin) untuk menggunakan Minastir:
#Contoh di Elendil
echo "nameserver 192.226.5.2" > /etc/resolv.conf

# Test DNS resolution via Minastir
nslookup google.com
ping google.com -c 3