if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

# Local user binaries
export PATH="$HOME/.local/bin:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Mason (Neovim LSP)
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

# Custom tools
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
export PATH="$HOME/.opencode/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"
export ZSH_DISABLE_COMPFIX=true

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf
  tmux
  z
)

source $ZSH/oh-my-zsh.sh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

ASYNCAPI_AC_ZSH_SETUP_PATH="$HOME/Library/Caches/@asyncapi/cli/autocomplete/zsh_setup"
[ -f "$ASYNCAPI_AC_ZSH_SETUP_PATH" ] && source "$ASYNCAPI_AC_ZSH_SETUP_PATH"

HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

alias ls="ls -G"
alias ll="ls -lah"
alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias v="nvim"
alias c="clear"

run_cpp() {
    if [[ -z "$1" ]]; then
        echo "Usage: run_cpp <file.cpp>"
        return 1
    fi

    local src="$1"
    local bin="${src%.cpp}"

    clang++ -std=c++17 -Wall -Wextra -Wpedantic "$src" -o "$bin" || return 1
    "./$bin"
    rm -f "$bin"
}

alias cpp="clang++ -std=c++17 -Wall -Wextra -Wpedantic"

