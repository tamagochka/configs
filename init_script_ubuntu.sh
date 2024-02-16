#!/bin/bash

echo "-------------------- system updating --------------------"
apt update
apt upgrade -y

echo "-------------------- installing software --------------------"
apt install -y zsh vim wget screenfetch git tmux mc curl

echo "-------------------- downloading configuration files --------------------"
wget -O .zshrc https://raw.githubusercontent.com/tamagochka/configs/main/.zshrc
wget -O .vimrc https://raw.githubusercontent.com/tamagochka/configs/main/.vimrc

echo "-------------------- coping files and setting permissions --------------------"
cp .zshrc /root
cp .vimrc /root
chown user:user .zshrc
chown user:user .vimrc

echo "-------------------- setting default shell --------------------"
chsh -s /bin/zsh user
chsh -s /bin/zsh root

echo "-------------------- setting timezone --------------------"
timedatectl set-timezone 'Europe/Moscow'
