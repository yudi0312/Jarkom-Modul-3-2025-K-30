# Elendil, Isildur, Anarion
apt-get update
apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2 curl

curl -sSL https://packages.sury.org/php/README.txt | bash -x
apt-get update

apt-get install -y php8.4 php8.4-fpm php8.4-cli php8.4-common php8.4-mysql php8.4-xml php8.4-xmlrpc php8.4-curl php8.4-gd php8.4-imagick php8.4-dev php8.4-imap php8.4-mbstring php8.4-opcache php8.4-soap php8.4-zip php8.4-intl php8.4-bcmath

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

apt-get install -y nginx
apt-get install -y git

php -v
composer --version
nginx -v

cd /var/www

git clone https://github.com/martuafernando/laravel-praktikum-jarkom.git laravel
cd laravel
composer install
cp .env.example .env
php artisan key:generate
chown -R www-data:www-data /var/www/laravel
chmod -R 775 /var/www/laravel/storage
chmod -R 775 /var/www/laravel/bootstrap/cache

ls -la /var/www/laravel
systemctl status php8.4-fpm
systemctl status nginx