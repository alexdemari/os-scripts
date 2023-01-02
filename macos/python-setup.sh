#!/bin/bash

# Install Homebrew
install_homebrew() {
  curl -fs -o /tmp/install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
  bash /tmp/install.sh
  export PATH=$PATH:/opt/homebrew/bin
}

# Install bash and set it as default shell
setup_bash() {
  brew install bash bash-completion
  chsh -s /bin/bash
}

# Install xcode-select
install_xcode_select() {
  whereis xcode-select || xcode-select --install
}

# Install useful tools
install_tools() {
  brew install git awscli openssl postgresql@11
  brew install --cask docker dbeaver-community
  brew install docker-completion
}

install_pyenv() {
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
  echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
  source ~/.bash_profile
  git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
  echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.
  source ~/.bash_profile
}

git_config() {
  git config --global alias.co checkout
  git config --global alias.ba "branch -a"
  git config --global alias.bd "branch -D"
  git config --global alias.ca "commit -a -m"
  git config --global core.autocrlf false
  git config --global alias.st "status --short --branch"
  git config --global alias.merc "merge --no-ff"
  git config --global alias.grog "log --graph --abbrev-commit --decorate --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)'"
  git config --global push.default simple
  git config --global core.editor "nano"
}

install_homebrew
setup_bash
install_xcode_select
install_tools
git_config

if [ ! -d ~/.pyenv ]; then
  install_pyenv
fi
