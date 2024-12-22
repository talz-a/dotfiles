export HISTFILE=$HOME/.zhistory
export SAVEHIST=1000
export HISTSIZE=999

setopt prompt_subst
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

alias vim="nvim"
alias lg="lazygit"

export EDITOR="nvim"
export VISUAL="nvim"
export FZF_DEFAULT_COMMAND="fd --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --strip-cwd-prefix --exclude .git"

export PATH="$HOME/.local/scripts:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export GOPATH=$(go env GOPATH)
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

git_prompt_info() {
    local dirstatus=" OK"
    local dirty=" X"
    if [[ -n $(git status --porcelain 2> /dev/null | tail -n1) ]]; then
        dirstatus=$dirty
    fi
    local ref
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref=$(git rev-parse --short HEAD 2> /dev/null) || return
    echo " ${ref#refs/heads/}$dirstatus"
}
dir_info="%(5~|%-1~/.../%2~|%4~)"
promptnormal="$ "
PROMPT="${dir_info}\$(git_prompt_info) ${promptnormal}"

bindkey -v
bindkey -s ^f "tmux-sessionizer\n"
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh

eval "$(fzf --zsh)"
