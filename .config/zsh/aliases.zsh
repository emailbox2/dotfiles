# Setting nvim
#alias vim=/usr/bin/nvim

# Setting yadm
alias yadm=~/.local/bin/yadm

alias yst='yadm status'
alias yau='yadm add -u'
alias yaa='yadm add --all'
alias yc='yadm commit -v'
alias yp='yadm push'
alias yl='yadm pull'
alias ydf='yadm difftool'
alias ydfs='yadm difftool --staged'
alias ysuri='yadm submodule update --recursive --init'
alias gdf='git difftool'
alias gdfs='git difftool --staged'
alias gcod='git checkout .'
alias gmd='git merge develop'

# Reload zsh config
alias reload!='RELOAD=1 source ~/.zshrc'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l="ls -lah ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -lFh ${colorflag}"
alias lld="ls -l | grep ^d"
alias rmf="rm -rf"

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# IP addresses
alias ipo="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# File size
alias fs="stat -f \"%z bytes\""

# Faster vim
alias v="vim -p"

# ROT13-encode text. Works for decoding, too! ;)
#alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# Empty the Trash on all mounted volumes and the main HDD
#alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
#alias stfu="osascript -e 'set volume output muted true'"
#alias pumpitup="osascript -e 'set volume 10'"


# Navigate to branches using FZF "!checkout_fzf()
function cof() { git branch | fzf | xargs git checkout; }
# Add files using FZF "!add_fzf()
function af() { git status -s | awk '{print $2}' | fzf -m | xargs git add; }
# Add files using FZF and immediately commit them "!add_fzf_amend()
function afmend() { git status -s | awk '{print $2}' | fzf -m | xargs git add && git commit --amend; }
# Restore files (like removing multiple files from the staging area)  "!restore_fzf()
function ref()  { git status -s | awk '{print $2}' | fzf -m | xargs git restore --staged; }
# Delete untracked files using FZF "!delete_untracked()
function rmfu() { git ls-files --exclude-standard --other | fzf -m | xargs rm; }

