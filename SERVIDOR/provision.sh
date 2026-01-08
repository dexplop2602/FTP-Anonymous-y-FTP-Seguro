#!/bin/bash

sudo apt-get update
echo "--- Instalando VSFTPD ---"
sudo apt-get install -y vsftpd

sudo cp /vagrant/vsftpd.conf /etc/vsftpd.conf

echo "--- Reiniciando servicio ---"
sudo systemctl restart vsftpd

echo "--- ESTADO DEL SERVICIO ---"
sudo systemctl status vsftpd --no-pager