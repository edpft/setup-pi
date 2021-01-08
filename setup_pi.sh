#! /bin/bash

# Update system
sudo apt-get update \
&& sudo apt-get -y dist-upgrade \
&& sudo apt-get -y autoremove \
&& sudo apt-get -y autoclean

# Disable password login
sudo nano /etc/ssh/sshd_config
# edit firewall
sudo service ssh reload

# reboot system
sudo reboot

# Install a firewall
sudo apt-get install ufw \
&& sudo update-alternatives --set iptables /usr/sbin/iptables-legacy \
&& sudo allow ssh \
&& sudo ufw limit ssh/tcp \
&& sudo ufw enable

# SSH
ssh-keygen -t ed25519 -C "edwardpaultaylor@gmail.com"
eval "$(ssh-agent -s)"
ssh-add

# Set up git
git config --global user.email "edwardpaultaylor@gmail.com" \
&& git config --global user.name "Ed Fawcett-Taylor"

echo "# setup-pi" >> README.md \
&& git init \
&& git add . \
&& git commit -m "initial commit" \
&& git branch -M main \
&& git remote add origin git@github.com:edpft/setup-pi.git \
&& git push -u origin main

# Install Python dependencies
sudo apt-get update \
&& sudo apt-get install -y --no-install-recommends make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev

# Set up pyenv
curl https://pyenv.run | bash \
&& echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc \
&& echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc \
&& echo 'eval "$(pyenv init -)"' >> ~/.bashrc \
&& echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc \
&& exec $SHELL

# Use pyenv to install Python 3.9.1
pyenv install 3.9.1
