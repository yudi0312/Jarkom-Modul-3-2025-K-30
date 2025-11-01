# Testing dari Client (Gilgalad/Amandil/Miriel/Celebrimbor)
# Test 1 : Elendil
# Di client (misal: Gilgalad)

apt-get update
apt-get install -y lynx

echo "nameserver 192.226.3.2" > /etc/resolv.conf
lynx -dump http://elendil.k30.com:8001
curl http://elendil.k30.com:8001/api/airing
curl http://192.226.1.2:8001

# TEst 2 : Isildur
lynx -dump http://isildur.k30.com:8002
curl http://isildur.k30.com:8002/api/airing
curl http://192.226.1.3:8002

# Test 3 : Anarion
lynx -dump http://anarion.k30.com:8003
curl http://anarion.k30.com:8003/api/airing
curl http://192.226.1.4:8003