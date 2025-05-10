#!/bin/bash

# Update & install screen
sudo apt update && sudo apt install -y screen curl

# Download dan ekstrak Verus miner
curl -L -o verus.tar.gz "https://raw.githubusercontent.com/hafidzziran/ngulikverus/main/verus_package.tar.gz"
tar -xvzf verus.tar.gz

# Masuk ke folder hasil ekstrak
cd verus_package || { echo "Folder verus_package tidak ditemukan!"; exit 1; }

# Beri izin eksekusi ke binary Verus
chmod +x ./verus

# Download skrip mining langsung ke dalam folder ini
curl -L -o mining.sh "https://raw.githubusercontent.com/hafidzziran/ngulikverus/main/mining.sh"
chmod +x mining.sh

# Jalankan mining di background
nohup ./mining.sh > mining.log 2>&1 &
