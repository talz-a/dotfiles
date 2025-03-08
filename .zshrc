autoload -U colors; colors;

export HISTFILE=$HOME/.zhistory
export SAVEHIST=1000
export HISTSIZE=999

setopt prompt_subst
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey -v

alias vim="nvim"
alias lg="lazygit"
alias ls="ls -G"
alias ll="ls -lG"
alias pn="pnpm"

export EDITOR="nvim"
export VISUAL="nvim"
export FZF_DEFAULT_COMMAND="fd --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --strip-cwd-prefix --exclude .git"

export PATH="/opt/homebrew/bin:$PATH"

export PATH="$HOME/.local/scripts:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export GOPATH=$(go env GOPATH)
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="$PATH:${ASDF_DATA_DIR:-$HOME/.asdf}/shims"


setopt prompt_subst
git_prompt_info() {
  local dirstatus=" OK"
  local dirty="%{$fg_bold[red]%} X%{$reset_color%}"
  if [[ ! -z $(git status --porcelain 2> /dev/null | tail -n1) ]]; then
    dirstatus=$dirty
  fi
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo " %{$fg_bold[green]%}${ref#refs/heads/}$dirstatus%{$reset_color%}"
}
local dir_info_color="%B"
local dir_info="%{$dir_info_color%}%(5~|%-1~/.../%2~|%4~)%{$reset_color%}"
local promptnormal="$ %{$reset_color%}"
local promptjobs="%{$fg_bold[red]%}$ %{$reset_color%}"
PROMPT='${dir_info}$(git_prompt_info) %(1j.$promptjobs.$promptnormal)'

bindkey -v
export KEYTIMEOUT=1
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q'
preexec() { echo -ne '\e[6 q' ;}


bindkey -s ^f "tmux-sessionizer\n"
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh

eval "$(fzf --zsh)"
