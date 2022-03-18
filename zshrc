# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# ctrl-backspace to delete an entire word
bindkey "\C-H"    backward-kill-word
bindkey '\e' vi-cmd-mode

export KUBE_EDITOR="/usr/bin/vim"
export PATH=$PATH:/usr/local/go/bin

alias kc='kubectl'
export LS_COLORS=$LS_COLORS:'ow=1;34:';

# Path to your oh-my-zsh installation.
export ZSH="/home/zpunix/.oh-my-zsh"

alias clip='clip.exe'
alias cwd='pwd|clip'


function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

function leetpy() {
    inp="$@"
    # echo "input: $inp"
    problem=$(echo "$inp" | tr '[A-Z]' '[a-z]' | tr ' ' '-')
    # echo "problem: $problem"
    problem+=".py"
    cp /home/zpunix/prog_sym_link/leetcode_pset/py_template.py $problem
    echo "python $problem" | clip
    vim $problem
}

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

if [[ $(pwd) == /mnt/c/Users/zacha ]]
then
    cd ~
fi

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish


# hide underlined paths
((${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

ZSH_DISABLE_COMPFIX=true
ZSH_THEME="robbyrussell"

### plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-vim-mode)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-vim-mode)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:$HOME/bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
