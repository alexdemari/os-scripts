#!/bin/bash

# Add git repo
sudo add-apt-repository ppa:git-core/ppa

# Install useful tools and libraries
sudo apt install git xclip python-dev libffi-dev build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev \
libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libaio1 libpq-dev libjpeg-dev make python-dev \
graphviz libgraphviz-dev pkg-config curl unzip zip gdebi equivs apt-transport-https ca-certificates curl gnupg-agent \
software-properties-common ssh python-pip3 awscli

# Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
source ~/.bash_profile
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.
source ~/.bash_profile
