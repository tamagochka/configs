#!/bin/bash

apt-get update
apt-get upgrade -y

apt-get install -y zsh vim wget screenfetch git tmux mc curl

wget -O .zshrc https://raw.githubusercontent.com/tamagochka/configs/main/.zshrc
wget -O .vimrc https://raw.githubusercontent.com/tamagochka/configs/main/.vimrc
wget -O id_rsa.pub https://raw.githubusercontent.com/tamagochka/configs/main/id_rsa.pub

cp .zshrc /root
cp .vimrc /root

mkdir .ssh
cat id_rsa.pub > .ssh/authorized_keys
chmod 700 .ssh
chmod 600 .ssh/authorized_keys
rm id_rsa.pub
chsh -s /bin/zsh
chsh -s /bin/zsh root

timedatectl set-timezone 'Europe/Moscow'
