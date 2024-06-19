#!/bin/bash

echo "-------------------- system updating --------------------"
apt update
apt upgrade -y

echo "-------------------- installing software --------------------"
apt install -y zsh vim wget screenfetch git tmux mc curl

echo "-------------------- downloading configuration files --------------------"
wget -O .zshrc https://raw.githubusercontent.com/tamagochka/configs/main/.zshrc
wget -O .vimrc https://raw.githubusercontent.com/tamagochka/configs/main/.vimrc
wget -O id_ed25519.pub https://raw.githubusercontent.com/tamagochka/configs/main/id_ed25519.pub
wget -O orbital.vim https://raw.githubusercontent.com/tamagochka/configs/main/orbital.vim
wget -O tmux.conf https://raw.githubusercontent.com/tamagochka/configs/main/tmux.conf

echo "-------------------- coping files and setting permissions --------------------"
cp .zshrc /root
cp .vimrc /root
chown user:user .zshrc
chown user:user .vimrc
mkdir -p /etc/vim/colors
mv orbital.vim /etc/vim/colors
mv tmux.conf /etc

echo "-------------------- setting default shell --------------------"
chsh -s /bin/zsh user
chsh -s /bin/zsh root


echo "-------------------- configuring ssh --------------------"
mkdir .ssh
cat id_ed25519.pub > .ssh/authorized_keys
chmod 700 .ssh
chmod 600 .ssh/authorized_keys
chown -R user:user .ssh
rm id_ed25519.pub

echo "-------------------- setting timezone --------------------"
timedatectl set-timezone 'Europe/Moscow'
