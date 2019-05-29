# utils
export LANG=ja_JP.UTF-8
setopt no_beep
autoload colors
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
stty stop undef
stty start undef

# completions
fpath=(
    /usr/local/share/zsh-completions
    $fpath
)
autoload -U compinit
compinit -u

setopt hist_expand
setopt auto_pushd
setopt auto_param_keys

zstyle ':completion:*' verbose yes
zstyle ':completion:*' use-cache yes
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# history
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space

# prompt
setopt prompt_subst

autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' enable git hg svn
zstyle ':vcs_info:*' formats '[%b%c%u]'
zstyle ':vcs_info:*' actionformats '[%b%c%u|%a]'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr '*'
add-zsh-hook precmd vcs_info

PROMPT='%2~${vcs_info_msg_0_} > '
RPROMPT='[$(uname)]'

export FZF_DEFAULT_OPTS='--height 70% --reverse'
function ghqq() {
	moveto=$(ghq list | fzf)
	if ! [ "$moveto" = "" ]; then
		cd $(ghq root)/$moveto
	fi
}
autoload -Uz ghqq

# alias
alias la="ls -la"
alias reload="exec -l $SHELL"
alias vi="nvim"
alias vim="nvim"
alias editvim="nvim ~/dotfiles/init.vim"
alias editzsh="nvim ~/dotfiles/zshrc"
alias edittmux="nvim ~/dotfiles/tmux.conf"
alias cdnvimswap="cd /Users/uetash/.local/share/nvim/swap"
if [ "$(uname)" = 'Darwin' ]; then
    alias ls="${aliases[ls]:-ls} -G"
else
    alias ls='ls --color'
fi
