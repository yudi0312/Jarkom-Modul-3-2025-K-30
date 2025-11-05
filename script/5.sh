# Amdir
apt-get update
apt-get install bind9 bind9utils dnsutils -y

nano /etc/bind/named.conf.local
# Isi dengan konfigurasi berikut : 
# Zone slave untuk k30.com
zone "k30.com" {
    type slave;
    file "/var/lib/bind/k30.com";
    masters { 192.226.3.2; };
};

# Reverse DNS slave untuk 192.226.1.0/24
zone "1.226.192.in-addr.arpa" {
    type slave;
    file "/var/lib/bind/1.226.192.in-addr.arpa";
    masters { 192.226.3.2; };
};

# Reverse DNS slave untuk 192.226.2.0/24
zone "2.226.192.in-addr.arpa" {
    type slave;
    file "/var/lib/bind/2.226.192.in-addr.arpa";
    masters { 192.226.3.2; };
};

# Reverse DNS slave untuk 192.226.3.0/24
zone "3.226.192.in-addr.arpa" {
    type slave;
    file "/var/lib/bind/3.226.192.in-addr.arpa";
    masters { 192.226.3.2; };
};

# Reverse DNS slave untuk 192.226.4.0/24
zone "4.226.192.in-addr.arpa" {
    type slave;
    file "/var/lib/bind/4.226.192.in-addr.arpa";
    masters { 192.226.3.2; };
};

nano /etc/bind/named.conf.options

options {
    directory "/var/cache/bind";

    allow-query { any; };

    listen-on { any; };
    listen-on-v6 { any; };

    recursion yes;

    forwarders {
        192.168.122.1;
    };

    dnssec-validation no;
};

service named restart
# Testing

# Update nameserver ke Amdir (DNS Slave)
echo "nameserver 192.226.3.2" > /etc/resolv.conf

# Test query yang sama seperti di Erendis
nslookup elros.k30.com
nslookup pharazon.k30.com
nslookup www.k30.com

# Test TXT records
dig elros.k30.com TXT
dig pharazon.k30.com TXT

# Test TXT records di Amdir
dig elros.k30.com TXT @192.226.3.3
dig pharazon.k30.com TXT @192.226.3.3

# Test Reverse DNS
nslookup 192.226.3.2
nslookup 192.226.3.3

