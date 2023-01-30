#!/bin/bash

echo "-------------------- system updating --------------------"
apt update
apt upgrade -y

echo "-------------------- installing software --------------------"
apt install -y zsh vim wget screenfetch git tmux mc curl

echo "-------------------- downloading configuration files --------------------"
wget -O .zshrc https://raw.githubusercontent.com/tamagochka/configs/main/.zshrc
wget -O .vimrc https://raw.githubusercontent.com/tamagochka/configs/main/.vimrc
wget -O id_rsa.pub https://raw.githubusercontent.com/tamagochka/configs/main/id_rsa.pub

echo "-------------------- coping files and setting permissions --------------------"
cp .zshrc /root
cp .vimrc /root
chown user:user .zshrc
chown user:user .vimrc

echo "-------------------- setting default shell --------------------"
chsh -s /bin/zsh user
chsh -s /bin/zsh root


echo "-------------------- configuring ssh --------------------"
mkdir .ssh
cat id_rsa.pub > .ssh/authorized_keys
chmod 700 .ssh
chmod 600 .ssh/authorized_keys
chown -R user:user .ssh
rm id_rsa.pub

echo "-------------------- setting timezone --------------------"
timedatectl set-timezone 'Europe/Moscow'
