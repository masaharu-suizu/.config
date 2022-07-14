#!/usr/bin/env bash

curl -Ss https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
     -o ~/git-completion.bash

curl -Ss https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
     -o ~/git-prompt.sh

cat <<EOM
if [ -f ~/git-completion.bash ]; then
    source ~/git-completion.bash
fi
if [ -f ~/git-prompt.sh ]; then
    source ~/git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# PS1='[\[\033[32m\]\u@\h\[\033[00m\] \[\033[33m\]\w\[\033[1;36m\]\$(__git_ps1 " (%s)")\[\033[00m\]]\n\$ '
EOM

exit 0

