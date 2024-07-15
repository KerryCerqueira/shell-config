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
alias ll='eza --colour=always --icons=always --classify=always -l -T --level=1'
alias lt='eza --colour=always --icons=always --classify=always -l -T --level=2'
alias ltt='eza --colour=always --icons=always --classify=always -l -T --level=3'
alias lT='eza --colour=always --icons=always --classify=always -l -T'
