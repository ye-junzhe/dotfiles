set fish_greeting

# starship
starship init fish | source

alias fc="nvim ~/.config/fish/config.fish"
alias alc="nvim ~/.config/alacritty/alacritty.yml"
alias kc="nvim ~/.config/kitty/kitty.conf"
alias fs="source ~/.config/fish/config.fish"
alias yabaiconfig="nvim ~/.config/yabai/yabairc"
alias skhdconfig="nvim ~/.config/skhd/skhdrc"
alias tmuxconfig="nvim ~/.tmux.conf"
alias zs="source ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vscode="/applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias vimconfig="nvim ~/.vimrc"
alias nv="/opt/homebrew/bin/nvim"
alias lv="/Users/mcf4r/.local/bin/lvim"
alias cl="clear"
alias rust="evcxr"
alias nn="neovide"
alias ls="exa --icons"
alias op="open ."
alias coding="skhd --start-service; yabai --start-service; brew services restart sketchybar"
alias finish="skhd --stop-service; yabai --stop-service; brew services stop sketchybar"
alias home="cd ~"
alias ".."="cd .."
alias em="emacsclient -c -a 'emacs'"
alias zed="/Applications/Zed.app/Contents/MacOS/cli"
alias todo="/Users/mcf4r/Dev/Software/todo.c/todo"
alias r="ranger"
alias mvi="mpv -profile image"
alias e="exit"
alias cat="bat"
alias ssc="nvim ~/.config/starship.toml"
alias v="vifm"

set -U EDITOR nvim
set -U VISUAL nvim

# metasploit-framework
fish_add_path /opt/metasploit-framework/bin

# JAVA openjdk
set -x JAVA_HOME /opt/homebrew/Cellar/openjdk/17.0.2/libexec/openjdk.jdk/Contents/Home 

# GO
fish_add_path /Users/mcf4r/go/bin

# 添加 .NET Core SDK 工具
fish_add_path /Users/mcf4r/.dotnet/tools

# cargo & rustup
fish_add_path ~/.cargo/bin/
# env RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup rustup install stable # for stable
# env RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup rustup install nightly # for nightly

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

# Sketchybar interactivity overloads
# function brew
#     command brew $argv
#
#     if string match -q "upgrade" $argv || string match -q "update" $argv || string match -q "outdated" $argv
#         sketchybar --trigger brew_update
#     end
# end

function margin
    if test $argv[1] = "on"
        yabai -m config top_padding 20
        sketchybar --animate sin 30 --bar margin=10 y_offset=10 corner_radius=9
    else
        yabai -m config top_padding 10
        sketchybar --animate sin 30 --bar margin=0 y_offset=0 corner_radius=0
    end
end

function zen
    ~/.config/sketchybar/plugins/zen.sh $argv
end

# Spotify theme
fish_add_path /Users/mcf4r/.spicetify

# Doom emacs bin
fish_add_path /Users/mcf4r/.emacs.d/bin

# llvm
fish_add_path /opt/homebrew/opt/llvm/bin
set -x LDFLAGS -L/opt/homebrew/opt/llvm/lib
set -x CPPFLAGS -I/opt/homebrew/opt/llvm/include
set -x LDFLAGS -L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++
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

# Mac setup for pomo
alias work="timer 40m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"
        
alias rest="timer 30m && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work 😬'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"

# risc-v tools
fish_add_path /Users/mcf4r/Dev/Software/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-apple-darwin/bin/

# ranger
set -x RANGER_LOAD_DEFAULT_RC false

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
