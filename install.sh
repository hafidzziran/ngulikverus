#!/bin/bash

# Update & install screen
sudo apt update && sudo apt install -y screen curl

# Download dan ekstrak SRBMiner
curl -L -o srbminer.tar.gz "https://raw.githubusercontent.com/hafidzziran/ngulikverus/main/SRBMiner-Multi-2-8-6-Linux.tar.gz"
mkdir -p srbminer_package && tar -xvzf srbminer.tar.gz -C srbminer_package --strip-components=1

# Masuk ke folder hasil ekstrak
cd srbminer_package || { echo "Folder srbminer_package tidak ditemukan!"; exit 1; }

# Beri izin eksekusi ke binary SRBMiner
chmod +x ./SRBMiner-MULTI

# Download skrip mining langsung ke dalam folder ini
curl -L -o mining.sh "https://raw.githubusercontent.com/hafidzziran/ngulikverus/main/mining.sh"
chmod +x mining.sh

# Jalankan mining di background
nohup ./mining.sh > mining.log 2>&1 &
