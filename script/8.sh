# Palantir
apt-get update
apt-get install -y mariadb-server

service mysql start

mysql_secure_installation

#- Enter current password for root: [ENTER] (kosong)
#- Switch to unix_socket authentication: N
#- Change the root password: Y
#- New password: password123
#- Re-enter new password: password123
#- Remove anonymous users: Y
#- Disallow root login remotely: N  
#- Remove test database: Y
#- Reload privilege tables: Y

mysql -u root -p
# Password: password123

# Di MySQL 
CREATE DATABASE dbjarkom;

CREATE USER 'userjarkom'@'%' IDENTIFIED BY 'passwordjarkom';

GRANT ALL PRIVILEGES ON dbjarkom.* TO 'userjarkom'@'%';
FLUSH PRIVILEGES;

SHOW DATABASES;
SELECT user, host FROM mysql.user;

EXIT;

nano /etc/mysql/mariadb.conf.d/50-server.cnf
# Cari baris bind-address dan ubah:
# Ubah dari:
bind-address = 127.0.0.1

# Menjadi:
bind-address = 0.0.0.0

service mysql restart
netstat -tulpn | grep 3306
# Expected: 0.0.0.0:3306

mysql -u userjarkom -ppasswordjarkom -h 192.226.3.3 dbjarkom

# ELendil, Isildur, dan Anarion
# Di Elendil / Isildur / Anarion
cd /var/www/laravel
nano .env
# Update dengan ini :
APP_NAME=Laravel
APP_ENV=local
APP_KEY=base64:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
APP_DEBUG=true
APP_URL=http://localhost

LOG_CHANNEL=stack
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=debug

DB_CONNECTION=mysql
DB_HOST=192.226.3.3         
DB_PORT=3306
DB_DATABASE=dbjarkom
DB_USERNAME=userjarkom
DB_PASSWORD=passwordjarkom

BROADCAST_DRIVER=log
CACHE_DRIVER=file
FILESYSTEM_DISK=local
QUEUE_CONNECTION=sync
SESSION_DRIVER=file
SESSION_LIFETIME=120

MEMCACHED_HOST=127.0.0.1

REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=smtp
MAIL_HOST=mailpit
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS="hello@example.com"
MAIL_FROM_NAME="${APP_NAME}"

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=
AWS_USE_PATH_STYLE_ENDPOINT=false

PUSHER_APP_ID=
PUSHER_APP_KEY=
PUSHER_APP_SECRET=
PUSHER_HOST=
PUSHER_PORT=443
PUSHER_SCHEME=https
PUSHER_APP_CLUSTER=mt1

VITE_APP_NAME="${APP_NAME}"
VITE_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
VITE_PUSHER_HOST="${PUSHER_HOST}"
VITE_PUSHER_PORT="${PUSHER_PORT}"
VITE_PUSHER_SCHEME="${PUSHER_SCHEME}"
VITE_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"

# Test koneksi database dari Laravel Worker
cd /var/www/laravel
php artisan tinker

# Di tinker prompt, test koneksi
DB::connection()->getPdo();
# Jika berhasil, akan muncul PDO object
# Tekan Ctrl+D untuk exit
exit

#Elendil
nano /etc/nginx/sites-available/elendil
# Isi dengan konfigurasi berikut :
server {
    listen 8001;
    server_name elendil.k30.com;

    root /var/www/laravel/public;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }

    if ($host != "elendil.k30.com") {
        return 403;
    }

    error_log /var/log/nginx/elendil_error.log;
    access_log /var/log/nginx/elendil_access.log;
}

ln -s /etc/nginx/sites-available/elendil /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default
nginx -t
service nginx restart
service php8.4-fpm restart
service nginx status
service php8.4-fpm status
netstat -tulpn | grep 8001

# Isildur
nano /etc/nginx/sites-available/isildur
# Isi dengan konfigurasi berikut ini :
server {
    listen 8002;
    server_name isildur.k30.com;

    root /var/www/laravel/public;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }

    if ($host != "isildur.k30.com") {
        return 403;
    }

    error_log /var/log/nginx/isildur_error.log;
    access_log /var/log/nginx/isildur_access.log;
}

ln -s /etc/nginx/sites-available/isildur /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default
nginx -t
service nginx restart
service php8.4-fpm restart
netstat -tulpn | grep 8002

#Anarion
nano /etc/nginx/sites-available/anarion
# Isi dengan konfigurasi berikut :
server {
    listen 8003;
    server_name anarion.k30.com;

    root /var/www/laravel/public;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }

    if ($host != "anarion.k30.com") {
        return 403;
    }

    error_log /var/log/nginx/anarion_error.log;
    access_log /var/log/nginx/anarion_access.log;
}

ln -s /etc/nginx/sites-available/anarion /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default
nginx -t
service nginx restart
service php8.4-fpm restart
netstat -tulpn | grep 8003

# Elendil
cd /var/www/laravel
php artisan tinker
# Di tinker:
DB::connection()->getPdo();
exit

php artisan migrate

# Expected output:
# Migration table created successfully.
# Migrating: xxxx_create_users_table
# Migrated:  xxxx_create_users_table
# ... dst

php artisan db:seed
php artisan migrate:fresh --seed

mysql -h 192.226.3.3 -u userjarkom -ppasswordjarkom dbjarkom -e "SHOW TABLES;"
mysql -h 192.226.3.3 -u userjarkom -ppasswordjarkom dbjarkom -e "SELECT COUNT(*) FROM animes;"