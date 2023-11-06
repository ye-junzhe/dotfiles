set fish_greeting

# starship
starship init fish | source

# alias
## configs
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
alias make="gmake"
alias v="vifm"
alias ld="ld.lld"
## Shortcut
alias cl="clear"
alias home="cd ~"
alias ".."="cd .."
alias e="exit"
alias op="open ."
alias vscode="/applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias nn="neovide"
alias nv="/opt/homebrew/bin/nvim"
alias todo="/Users/mcf4r/Dev/Software/todo.c/todo"

set -U EDITOR nvim
set -U VISUAL nvim

# metasploit-framework
fish_add_path /opt/metasploit-framework/bin

# JAVA openjdk
fish_add_path /opt/homebrew/opt/openjdk/bin
set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk/include"

# GO
fish_add_path /Users/mcf4r/go/bin

# 添加 .NET Core SDK 工具
fish_add_path /Users/mcf4r/.dotnet/tools

# cargo & rustup
fish_add_path ~/.cargo/bin/
set -x RUSTUP_DIST_SERVER https://mirrors.tuna.tsinghua.edu.cn/rustup # for stable
# set -x RUSTUP_DIST_SERVER https://mirrors.tuna.tsinghua.edu.cn/rustup # for nightly
# set -x RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
# set -x RUSTUP_UPDATE_ROOT https://mirrors.ustc.edu.cn/rust-static/rustup

# HOMEBREW
fish_add_path "/opt/homebrew/bin/"

# export HOMEBREW_BOTTLE_DOMAIN=https://ghcr.io/v2/homebrew/core

set -x HOMEBREW_GITHUB_API_TOKEN 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
set -x HOMEBREW_INSTALL_FROM_API 1
set -x HOMEBREW_API_DOMAIN https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api
set -x HOMEBREW_BOTTLE_DOMAIN https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
set -x HOMEBREW_BREW_GIT_REMOTE https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
set -x HOMEBREW_CORE_GIT_REMOTE https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git

# Ruby
chruby 3.1.0

# pnpm
set -x PNPM_HOME /opt/homebrew/Cellar/pnpm/8.5.1/bin
fish_add_path $PNPM_HOME

# Spotify theme
fish_add_path /Users/mcf4r/.spicetify

# llvm
fish_add_path /opt/homebrew/opt/llvm/bin
set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"
set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"
# llvm-project
# fish_add_path /Users/mcf4r/GitHubClone/llvm-project/build/bin
# set -x LDFLAGS -L/Users/mcf4r/GithubClone/llvm-project/build/lib
# set -x CPPFLAGS -I/Users/mcf4r/GithubClone/llvm-project/build/include
# set -x LDFLAGS -L/Users/mcf4r/GithubClone/llvm-project/build/lib -Wl,-rpath,/Users/mcf4r/GitHubClone/llvm-project/build/lib

# yazi
fish_add_path ~/Dev/Software/yazi/target/release
function d
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/mcf4r/miniconda/bin/conda
    eval /Users/mcf4r/miniconda/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/Users/mcf4r/miniconda/etc/fish/conf.d/conda.fish"
        . "/Users/mcf4r/miniconda/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/Users/mcf4r/miniconda/bin" $PATH
    end
end
# <<< conda initialize <<<

# risc-v tools
fish_add_path /Users/mcf4r/Dev/Software/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-apple-darwin/bin/

# ranger
# set -x RANGER_LOAD_DEFAULT_RC false

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
set -l AUTOJUMP_PATH /opt/homebrew/share/autojump/autojump.fish
source $AUTOJUMP_PATH
