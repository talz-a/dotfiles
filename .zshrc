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
alias g++="g++ -std=c++23"
alias c++="c++ -std=c++23"

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
    local dirty="%{$fg[red]%} X%{$reset_color%}"
    if [[ -n $(git status --porcelain 2> /dev/null | tail -n1) ]]; then
        dirstatus=$dirty
    fi
    local ref
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref=$(git rev-parse --short HEAD 2> /dev/null) || return
    echo " %{$fg[green]%}${ref#refs/heads/}$dirstatus%{$reset_color%}"
}
dir_info_color="%F{white}"
dir_info="%{$dir_info_color%}%(5~|%-1~/.../%2~|%4~)%{$reset_color%}"
promptnormal="$ %{$reset_color%}"
promptjobs="%{$fg[red]%}φ %{$reset_color%}"
PROMPT="${dir_info}\$(git_prompt_info) %(1j.${promptjobs}.${promptnormal})"

bindkey -v
bindkey -s ^f "tmux-sessionizer\n"
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh

eval "$(fzf --zsh)"
