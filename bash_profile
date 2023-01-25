cd ~/Desktop

##
# Your previous /Users/zhifanzhu/.bash_profile file was backed up as /Users/zhifanzhu/.bash_profile.macports-saved_2018-06-20_at_12:03:06
##

# MacPorts Installer addition on 2018-06-20_at_12:03:06: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
# export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad
# alias ls='ls -GFh'

export PATH=/anaconda3/bin:$PATH
export LANG=en_US.UTF-8

export PATH="/usr/local/opt/go@1.9/bin:$PATH"

alias grepn='grep -rn --color --exclude="tags"'
alias agn='ag --ignore="tags"'

export Torchsrc="/anaconda3/envs/torch/lib/python3.5/site-packages/torch/"

[ -s "/Users/zhifanzhu/.scm_breeze/scm_breeze.sh" ] && source "/Users/zhifanzhu/.scm_breeze/scm_breeze.sh"
if [ -e /Users/zhifanzhu/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/zhifanzhu/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export LC_ALL=en_US.UTF-8

# OpenJDK
export PATH=$HOME/jdk-17.0.2.jdk/Contents/Home/bin:$PATH
export JAVA_HOME=$HOME/jdk-17.0.2.jdk/Contents/Home
# Maven
export PATH=$HOME/apache-maven-3.8.4/bin:$PATH

# unalias gs
