# =================================================== #
#    ___  _____      _        ______ _   ___      __  #
#   |__ \|  __ \    | |      |  ____| \ | \ \    / /  #
#      ) | |__) |__ | |      | |__  |  \| |\ \  / /   #
#     / /|  ___/ _ \| |      |  __| | . ` | \ \/ /    #
#    / /_| |  | (_) | |____  | |____| |\  |  \  /     #
#   |____|_|   \___/|______| |______|_| \_|   \/      #
#                                                     #
#                                                     #
# =================================================== #

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/hyue/.oh-my-zsh"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# ZSH_THEME="bira"
ZSH_THEME="powerlevel10k/powerlevel10k"

# # prue theme begin
# fpath+=$HOME/.zsh/pure
# autoload -U promptinit; promptinit
# zmodload zsh/nearcolor

# # optionally define some options
# PURE_CMD_MAX_EXEC_TIME=10
# # change the path color
# zstyle :prompt:pure:path color blue
# zstyle :prompt:pure:virtualenv color '#800080'
# zstyle :prompt:pure:prompt color  magenta
# # turn on git stash status
# zstyle :prompt:pure:git:stash show yes
# zstyle :prompt:pure:git:arrow show yes

# prompt pure
# # pure theme end

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# This speed up zsh-autosuggetions by a lot
export ZSH_AUTOSUGGEST_USE_ASYNC='true'

# zsh-completion fpath
__2PoL_ZSH_COMPLETION_SRC="$ZSH/custom/plugins/zsh-completions/src"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	zsh-autosuggestions
	# zsh-syntax-highlighting
	fast-syntax-highlighting
	autojump
	)

# ZSH completions
## For homebrew, is must be added before oh-my-zsh is called.
## https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
## https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/github/README.md#homebrew-installation-note
## Add a check avoiding duplicated fpath
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

## https://github.com/zsh-users/zsh-completions
[[ -d ${__2PoL_ZSH_COMPLETION_SRC} ]] && FPATH="${__2PoL_ZSH_COMPLETION_SRC}:$FPATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/hyue/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/hyue/miniforge3/etc/profile.d/conda.sh" ]; then
#        . "/Users/hyue/miniforge3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/hyue/miniforge3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

# doom emacs
export PATH="$HOME/.emacs.d/bin:$PATH"

# sqlite
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/sqlite/lib"
export CPPFLAGS="-I/usr/local/opt/sqlite/include"

# llvm
export PATH="/opt/homebrew/opt/llvm/13.0.1/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# mint
export PATH="$HOME/.mint/bin:$PATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

hash -d desktop="$HOME/Desktop"
hash -d music="$HOME/Music"
hash -d pictures="$HOME/Pictures"
hash -d picture="$HOME/Pictures"
hash -d downloads="$HOME/Downloads"
hash -d download="$HOME/Downloads"
hash -d documents="$HOME/Documents"
hash -d document="$HOME/Documents"
hash -d dropbox="$HOME/Dropbox"
hash -d services="$HOME/Services"
hash -d projects="$HOME/Project"
hash -d project="$HOME/Project"
hash -d tools="$HOME/Tools"
hash -d tool="$HOME/Tools"
hash -d applications="/Applications"
hash -d application="/Applications"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# Enable sudo in aliased
# http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

alias zshconfig="vim ~/.zshrc"
alias rzsh=". ~/.zshrc"
alias bu="brew upgrade"
alias bi="brew install"
alias bic="brew install --cask"
alias bui="brew uninstall"
alias bpb="brew bundle dump --file=~/brewfile"
alias dooms="doom sync"
alias doomu="doom upgrade"
alias sshcopy="pbcopy < ~/.ssh/id_rsa.pub && echo Copied id_rsa.pub"

alias q="cd $HOME && clear"
alias cp='cp -iv'          # Preferred 'cp' implementation
alias mv='mv -iv'          # Preferred 'mv' implementation
alias mkdir='mkdir -pv'    # Preferred 'mkdir' implementation
alias rmrf="rm -rf"

# function

docker-kill-all() {
    docker kill $(docker ps -aq)
}

git-config() {
    echo -n "
===================================
      * Git Configuration *
-----------------------------------
Please input Git Username: "

    read username

    echo -n "
-----------------------------------
Please input Git Email: "

    read email

    echo -n "
-----------------------------------
Done!
===================================
"

    git config --global user.name "${username}"
    git config --global user.email "${email}"
}

find_folder_by_name() {
    local dir="$1"
    local name="$2"
    if (( $+commands[fd] )) &>/dev/null; then
        fd --color "never" -H -g --type d $name $dir
    else
        find $dir -type d -name $name
    fi
}

update_ohmyzsh_custom_plugins() {
    red=$(tput setaf 1)
    blue=$(tput setaf 4)
    green=$(tput setaf 2)
    reset=$(tput sgr0)

    echo ""
    printf "${blue}%s${reset}\n" "Upgrading custom plugins"

    find_folder_by_name "${ZSH_CUSTOM:-$ZSH/custom}" ".git" | while read LINE; do
        p=${LINE:h}
        pushd -q "${p}"

        if git pull --rebase; then
            printf "${green}%s${reset}\n" "${p:t} has been updated and/or is at the current version."
        else
            printf "${red}%s${reset}\n" "There was an error updating ${p:t}. Try again later?"
        fi
        popd -q
    done
}

prompt_sukka_npm_type() {
    _p9k_upglob yarn.lock
    (( $? == 1 )) && {
        p10k segment -s "YARN" -f blue -t "yarn"
        return
    }
    _p9k_upglob pnpm-lock.yaml
    (( $? == 1 )) && {
        p10k segment -s "PNPM" -f yellow -t "pnpm"
        return
    }
    _p9k_upglob package-lock.json
    (( $? == 1 )) && {
        p10k segment -s "NPM" -f red -t "npm"
        return
    }
    _p9k_upglob package.json
    (( $? == 1 )) && {
        p10k segment -s "NPM" -f red -t "npm"
        return
    }
}
