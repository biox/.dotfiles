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

# Setup GPG sockets properly
GPG_AGENT_SOCKET="${HOME}/.gnupg/S.gpg-agent.ssh"
if [ ! -S $GPG_AGENT_SOCKET ]; then
  gpg-agent --daemon >/dev/null 2>&1
  export GPG_TTY=$(tty)
fi

# Set SSH to use gpg-agent if it is configured to do so
GNUPGCONFIG=${GNUPGHOME:-"$HOME/.gnupg/gpg-agent.conf"}
if grep -q enable-ssh-support "$GNUPGCONFIG"; then
  unset SSH_AGENT_PID
  export SSH_AUTH_SOCK=$GPG_AGENT_SOCKET
fi

# Point pass to ownCloud database
export PASSWORD_STORE_DIR="$HOME/ownCloud/pass"
