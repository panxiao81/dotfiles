#!/usr/bin/env bash

function check_os() {
  # check os type
  if [ $(uname -s) = "Darwin" ]; then
    OS="mac"
  elif [ $(uname -s) = "Linux" ]; then
    OS="linux"
  else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
  fi

  if [ $OS = "linux" ]; then
    . /etc/os-release
    OS=$ID
  fi
}

function install_package() {
  case $OS in
    mac)
      PACKAGE="brew install"
      ;;
    ubuntu)
      PACKAGE="sudo apt-get install -y"
      ;;
    arch)
      PACKAGE="sudo pacman -Sy"
      ;;
    *)
      echo "Your platform is not supported."
      exit 1
      ;;
  esac
}

function install_brew() {
  if ! which brew > /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

function main() {
  check_os
  install_package
  if [ $OS = "mac" ]; then
    install_brew
  fi

  echo "Installing packages in packages-$OS.txt..."
  if [ $OS = "ubuntu" ]; then
    ./repo-ubuntu.sh
  fi
  xargs $PACKAGE < packages-$OS.txt

  install_nvm
}

function install_nvm() {
  if command -v nvm > /dev/null; then
    echo "Installing nvm and node.js..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    source ~/.bashrc
    nvm install --lts
  fi
}

main
