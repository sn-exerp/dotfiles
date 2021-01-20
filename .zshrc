# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

umask 027

# My preferred theme
ZSH_THEME="avit"

# Auto correction is almost as annoying as T9
DISABLE_CORRECTION="true"

# Dots for the laugh
COMPLETION_WAITING_DOTS="false"

# Speed up Git status in repo
#DISABLE_UNTRACKED_FILES_DIRTY="true"

# Please don't do that
setopt no_share_history


# Some magic stuff
alias -s txt=vim
alias -s java=vim
alias -s html=vim
alias -s css=vim
alias -s js=vim
alias -s go="go run"
alias luke="git push --force"
alias anna="cd $HOME/dev/anna/code && cat src/main/resources/banner.txt | sed -e 's/v\${info\.app\.version}//'"
alias upgrade_gopls='cd && GO111MODULE=on go get golang.org/x/tools/gopls@latest'

#command -v ccat > /dev/null 2>&1 && alias cat=ccat

alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ctig="GIT_DIR=$HOME/.dotfiles/ GIT_WORK_TREE=$HOME tig"

blame() {
	git blame --date=relative "$*"
}

calc(){ awk "BEGIN{ print $* }" ;}

get_script_dir () {
     SOURCE="${BASH_SOURCE[0]}"
     # While $SOURCE is a symlink, resolve it
     while [ -h "$SOURCE" ]; do
          DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
          SOURCE="$( readlink "$SOURCE" )"
          # If $SOURCE was a relative symlink (so no "/" as prefix, need to resolve it relative to the symlink base directory
          [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
     done
     DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
     echo "$DIR"
}

if [ -f $HOME/.extra.sh ]; then
	source $HOME/.extra.sh
fi

plugins=(git ant golang mvn pass git-prompt)

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"

export GREP_COLOR=33

# Some programs expect this variable to be set even though dot is in the path
if [ -f /opt/local/bin/dot ]; then
	export GRAPHVIZ_DOT=/opt/local/bin/dot
fi

# Go
export CDPATH=$HOME/go/src/github.com/sorennielsen:$HOME/go/src/exerp.com

# Add my own bin directories to the path
export PATH=$HOME/bin:$HOME/go/bin:/opt/local/bin:/opt/local/sbin:$PATH
export LANG=da_DK.UTF-8

if [ -f /usr/libexec/java_home ]; then
	export JAVA_HOME=$(/usr/libexec/java_home)
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
