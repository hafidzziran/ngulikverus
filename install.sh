#!/bin/bash

# Update & install screen
sudo apt update && sudo apt install -y screen

# Download dan ekstrak Verus miner dari akun GitHub hafidzziran
curl -L -o verus_package.tar.gz "https://raw.githubusercontent.com/hafidzziran/ngulikverus/main/verus_package.tar.gz"
tar -xvzf verus_package.tar.gz && cd verus_package || cd .

# Beri izin eksekusi ke binary Verus
chmod +x ./verus

# Download skrip mining dari akun GitHub hafidzziran
curl -L -o mining.sh "https://raw.githubusercontent.com/hafidzziran/ngulikverus/main/mining.sh"

# Ubah kepemilikan agar bisa dieksekusi oleh user saat ini
chown $(whoami):$(whoami) mining.sh

# Beri izin eksekusi ke mining.sh
chmod +x mining.sh

# Jalankan mining di background
nohup ./mining.sh > mining.log 2>&1 &
