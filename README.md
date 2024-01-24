# dotfiles !

## Linux Env Setup

```bash
sudo apt install autojump exa zsh bat vifm gh make fzf ripgrep tldr btop

# Neovim: https://github.com/neovim/neovim/blob/master/BUILD.md
sudo apt-get install ninja-build gettext cmake unzip curl
git clone https://github.com/neovim/neovim
make CMAKE_BUILD_TYPE=Release
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb

# miniconda
# https://docs.conda.io/projects/miniconda/en/latest/
# Beware of the architecture
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh

# starship
# https://starship.rs/guide/#step-1-install-starship
curl -sS https://starship.rs/install.sh | sh

# rustup
# https://rustup.rs/
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# nvm
# https://github.com/nvm-sh/nvm#installing-and-updating

# dotfiles(vifm starship)
git clone https://github.com/ye-junzhe/dotfiles.git

# llvm

# zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git >> ~/Dev/Software/zsh_plugins/zsh-syntax-highlighting/
git clone https://github.com/zsh-users/zsh-autosuggestions >> ~/Dev/Software/zsh_plugins/zsh-autosuggestions/
git clone https://github.com/zsh-users/zsh-history-substring-search >> ~/Dev/Software/zsh_plugins/zsh-history-substring-search/
git clone https://github.com/MichaelAquilina/zsh-auto-notify.git >> ~/Dev/Software/zsh_plugins/zsh-auto-notify/
git clone https://github.com/hlissner/zsh-autopair.git >> ~/Dev/Software/zsh_plugins/zsh-autopair/

source ~/Dev/Software/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/Dev/Software/zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/Dev/Software/zsh_plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
source ~/Dev/Software/zsh_plugins/zsh-auto-notify/auto-notify.plugin.zsh
source ~/.config/zsh/plugins/zsh-autopair/autopair.zsh

# todo.c
```

```bash
# starship
eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/junzhe/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/junzhe/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/junzhe/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/junzhe/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# alias
## configs
alias zc="nvim ~/.zshrc"
alias fc="nvim ~/.config/fish/config.fish"
alias kc="nvim ~/.config/kitty/kitty.conf"
alias fs="source ~/.config/fish/config.fish"
alias tmuxconfig="nvim ~/.config/tmux/tmux.conf"
alias zs="source ~/.zshrc"
alias vimconfig="nvim ~/.vimrc"
alias rust="evcxr"
alias ssc="nvim ~/.config/starship.toml"
## Replacement
alias ls="exa --icons"
alias cat="bat"
# alias make="gmake"
alias v="vifm"
# alias ld="ld.lld"
## Shortcut
alias cl="clear"
alias home="cd ~"
alias "../"="cd ../"
alias e="exit"
alias op="open ."
alias code="/applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias nn="neovide"
alias nv="nvim"
alias todo="/Users/mcf4r/Dev/Software/todo.c/todo"
alias dora='dora-cli'

export EDITOR=nvim
export VISUAL=nvim

# cargo & rustup
export PATH="$HOME/.cargo/bin/:$PATH"
export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"


# autojump
source /usr/share/autojump/autojump.sh

# zsh-syntax-highlighting
source ~/Dev/Software/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# zsh-autosuggestions
source ~/Dev/Software/zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-history-substring-search
source ~/Dev/Software/zsh_plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# zsh-auto-notify
source ~/Dev/Software/zsh_plugins/zsh-auto-notify/auto-notify.plugin.zsh

# CASE_INSENSITIVE
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# zsh-autopair
source ~/.config/zsh/plugins/zsh-autopair/autopair.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion#
```
