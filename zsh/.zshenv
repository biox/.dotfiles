export CLICOLOR=1
export EDITOR="vim"
export LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;'
export GOPATH="$HOME/code/go"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LESS='-iMSFXR'
export PAGER=less
export PATH="$HOME/code/go/bin:$PATH"
export VISUAL="vim"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [[ `uname` == 'Linux' ]] ;then
  export PATH="$HOME/.rbenv/bin:$PATH"
else
  export PATH="$HOME/.rbenv/bin:$PATH"
  export RBENV_ROOT=/usr/local/var/rbenv
fi

# Start the daemon here since macbooks don't have i3
gpg-agent --daemon >/dev/null 2>&1

unset SSH_AGENT_PID
export GPG_TTY=$(tty)

if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export PASSWORD_STORE_DIR="$HOME/ownCloud/pass"
