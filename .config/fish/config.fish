set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx VCPKG_ROOT $HOME/vcpkg
set -gx QT_QPA_PLATFORMTHEME qt5ct

fish_add_path $HOME/.local/scripts
fish_add_path $VCPKG_ROOT
fish_add_path ~/.emacs.d/bin
fish_add_path $HOME/.local/bin

function fish_user_key_bindings
    fish_vi_key_bindings

    bind -M default \ch 'tmux select-pane -L'
    bind -M default \cj 'tmux select-pane -D'
    bind -M default \ck 'tmux select-pane -U'
    bind -M default \cl 'tmux select-pane -R'
    bind -M insert \ch 'tmux select-pane -L'
    bind -M insert \cj 'tmux select-pane -D'
    bind -M insert \ck 'tmux select-pane -U'
    bind -M insert \cl 'tmux select-pane -R'

    bind -M visual y fish_clipboard_copy
    bind -M default yy fish_clipboard_copy
    bind -M default p fish_clipboard_paste
    bind \cf 'tmux-sessionizer; commandline -f repaint'
    bind -M insert \cf 'tmux-sessionizer; commandline -f repaint'
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function gvim
    pkill -f "nvim --embed" 
    neovide --fork $argv >/dev/null 2>&1 &
    disown
end

alias vim="nvim"
alias lg="lazygit"
alias ls="ls --color=auto"
alias ll="ls -lh --color=auto"
alias tk="tmux kill-server"

if type -q fzf
    fzf --fish | source
end

set -g fish_greeting ""

