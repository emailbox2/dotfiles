#!/bin/sh

if [ "$(id -u)" != "0" ]; then
    RUN_AS_ROOT='sudo'
else
    RUN_AS_ROOT=''
fi




# $RUN_AS_ROOT apt update
# $RUN_AS_ROOT apt upgrade -y

# $RUN_AS_ROOT apt install -y git

# $RUN_AS_ROOT apt -y install zsh
# $RUN_AS_ROOT apt -y install tmux
# $RUN_AS_ROOT apt -y install curl
# $RUN_AS_ROOT apt -y install wget
# $RUN_AS_ROOT apt -y install silversearcher-ag
# $RUN_AS_ROOT apt -y install neovim



type yadm || {
echo 'Attempting to download yadm'
mkdir -p $HOME/.local/bin/
wget -O $HOME/.local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm || exit 1
chmod a+x $HOME/.local/bin/yadm || exit 1

}

echo ""


$HOME/.local/bin/yadm clone --bootstrap https://github.com/emailbox2/dotfiles.git

# echo "Install fzf"
# ~/.fzf/install  --key-bindings --completion --no-update-rc

