#!/bin/bash
apt update
apt install htop
apt install tmux
apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io
wget https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.1.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile
cd /home
mkdir admin
useradd -s /bin/bash admin
passwd admin
#TODO: auto deny password login in favor of keys
#TODO: delete docker prerouting from iptables + ufw
#TODO: autocreate services
#TODO: autologin to github for private repos
