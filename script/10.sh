# Elros
apt-get update
apt-get install -y nginx
nginx -v

nano /etc/nginx/sites-available/elros
# Isi dengan konfigurasi berikut ini : 
upstream kesatria_numenor {
    server 192.226.1.2:8001;  
    server 192.226.1.3:8002;  
    server 192.226.1.4:8003;  
}

server {
    listen 80;
    server_name elros.k30.com;

    location / {
        proxy_pass http://kesatria_numenor;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    error_log /var/log/nginx/elros_error.log;
    access_log /var/log/nginx/elros_access.log;
}

ln -s /etc/nginx/sites-available/elros /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default
nginx -t
service nginx restart
service nginx status
netstat -tulpn | grep :80

# Test Elros
cat /etc/nginx/sites-available/elros | grep -A 5 upstream
service nginx status
netstat -tulpn | grep :80

# Miriel
curl http://elros.k30.com
curl http://elros.k30.com/api/airing

for i in {1..10}; do
    curl -s http://elros.k30.com/api/airing | grep -o '"id":[0-9]*' | head -1
done

lynx http://elros.k30.com

for i in {1..20}; do
    curl -s -o /dev/null -w "%{http_code}\n" http://elros.k30.com/api/airing
done

# Elros
tail -f /var/log/nginx/elros_access.log
tail -100 /var/log/nginx/elros_access.log | grep -o "upstream.*" | sort | uniq -c

# Elendil
tail -f /var/log/nginx/access.log