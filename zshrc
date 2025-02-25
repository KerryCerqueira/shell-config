# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.local/share/zsh/antidote/antidote.zsh
antidote load $ZDOTDIR/zsh_plugins.conf

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' completions 'Alt-c'
zstyle ':completion:*' file-sort inode
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 'Alt-g'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' prompt 'Suggestions (%e errors):'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 'Alt-s'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/kerry/.zshrc'

autoload -Uz compinit
compinit -d $HOME/.cache/zsh/zcompdump

source ${HOME}/.config/zsh/p10k.zsh

if [[ ! -d "$HOME/.local/state/zsh" ]]; then
	mkdir -p "$HOME/.local/state/zsh"
fi
HISTFILE=$HOME/.local/state/zsh/zsh_history
HISTSIZE=1000
SAVEHIST=10000
unsetopt beep
bindkey -v
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
alias yazi='y'
alias moarr='moar --quit-if-one-screen --no-clear-on-exit --no-statusbar'
alias ls='eza\
	--group-directories-first\
	--git-repos\
	--git\
	--header\
	--no-permissions\
	--no-user\
	--colour-scale\
	--mounts'
alias ll='ls --colour=always --icons=always --long | moarr'
alias lll='eza\
	--group-directories-first\
	--git-repos\
	--git\
	--header\
	--colour-scale\
	--modified\
	--created\
	--long\
	--color-scale\
	--changed\
	--header\
	--group\
	--colour=always\
	--icons=always\
	--long\
	| moarr'
alias lt='ls --colour=always --icons=always --tree --level=2 | moarr'
alias ltt='ls --colour=always --icons=always --tree --level=3 | moarr'
alias lT='ls --colour=always --icons=always --tree --total-size | moarr'
alias llt='ls --colour=always --icons=always --long --tree --level=2 | moarr'
alias lltt='ls --colour=always --icons=always --long --tree --level=3 | moarr'
alias llT='ls --colour=always --icons=always --long --tree | moarr'
alias top='btop'
alias cat='bat'
alias diff='batdiff'
alias man='batman'
alias rg='batgrep'
