set fish_greeting

set -x https_proxy http://192.168.1.4:15732
set -x http_proxy http://192.168.1.4:15732  

# starship
starship init fish | source

# alias
## configs
alias fc="nvim ~/.config/fish/config.fish"
alias kc="nvim ~/.config/kitty/kitty.conf"
alias fs="source ~/.config/fish/config.fish"
alias tmuxconfig="nvim ~/.config/tmux/tmux.conf"
alias vimconfig="nvim ~/.vimrc"
alias ssc="nvim ~/.config/starship.toml"
## Replacement
alias ls="exa --icons"
alias v="vifm"
## Shortcut
alias cl="clear"
alias home="cd ~"
alias ".."="cd .."
alias e="exit"
alias op="xdg-open ."
alias nv="nvim"

set -U EDITOR nvim
set -U VISUAL nvim

# cargo & rustup
fish_add_path ~/.cargo/bin/
# set -x RUSTUP_DIST_SERVER https://mirrors.tuna.tsinghua.edu.cn/rustup # for stable
# set -x RUSTUP_DIST_SERVER https://mirrors.tuna.tsinghua.edu.cn/rustup # for nightly
set -x RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
set -x RUSTUP_UPDATE_ROOT https://mirrors.ustc.edu.cn/rust-static/rustup

# vifm
# NOTE: Remember that a function in shell is something you can call in terminal
# function v
#     set -l dst (command vifm . --choose-dir - $argv)
#     if test -z "$dst"
#         echo 'Directory picking cancelled/failed'
#         return 1
#     end
#     cd "$dst"
# end

# fzf
function FZF
    bind \cs 'fd -H | fzf --height 20'
end

FZF

# autojump
set -l AUTOJUMP_PATH /usr/share/autojump/autojump.fish
source $AUTOJUMP_PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/junzhe/miniconda3/bin/conda
    eval /home/junzhe/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/junzhe/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/junzhe/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/junzhe/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

# nvim
# fish_add_path ~/Dev/Software/neovim-release-0.9/build/bin
