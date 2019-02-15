# path
set -U fish_user_paths \
     /usr/local/bin \
     /usr/local/texlive/2015/bin/x86_64-darwin \
     /usr/local/opt/inetutils/libexec/gnubin \
     $HOME/go/bin \
     $HOME/.poem/bin \
     $HOME/.rbenv/shims \
     $fish_user_paths
# $HOME/Applications/IBM/ILOG/CPLEX_Studio1261/cplex/bin/x86-64_osx/ \

#rbenv init
set -gx PATH '/Users/shami/.rbenv/shims' $PATH
set -gx RBENV_SHELL fish
source '/usr/local/Cellar/rbenv/1.1.1/libexec/../completions/rbenv.fish'
command rbenv rehash 2>/dev/null
function rbenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (rbenv "sh-$command" $argv|psub)
  case '*'
    command rbenv "$command" $argv
  end
end

# prompt
function fish_prompt
    printf "%s %s " (prompt_pwd) (set_color brwhite)(echo ">")
end
# right prompt
function fish_right_prompt
    # git settings
    function _git_branch_name
        set -l branch (git symbolic-ref --quiet HEAD ^/dev/null)
        if set -q branch[1]
            echo (string replace -r '^refs/heads/' '' $branch)
        else
            echo (git rev-parse --short HEAD ^/dev/null)
        end
    end

    function _is_git_dirty
        echo (git status -s --ignore-submodules=dirty ^/dev/null)
    end

    function _is_git_repo
        type -q git
        or return 1
        git status -s >/dev/null ^/dev/null
    end

    function _is_new_repo
        echo (git diff --name-status remotes/origin/master ^/dev/null)
    end

    if _is_git_repo
        set -l git_branch (_git_branch_name)
        set git_info "$git_branch"
        if [ (_is_git_dirty) ]
	    set -l dirty "+"
            set git_info "$git_info$dirty"
	end
	if [ (_is_new_repo) ]
            set -l new "*"
            set git_info "$git_info$new"
        end
        set_color normal
        echo "[$git_info]"
    end
end

# exports
export FZF_DEFAULT_OPTS='--height 70% --reverse'

# my functions
function cmds -d "select past commnads"
    eval (commandline (history | awk '!a[$0]++' | fzf))
end
# bind C-s
eval (tty -s; stty stop undef)
bind \cs cmds

function ghqq -d "select ghq folders"
    cd (ghq root)/(ghq list | fzf)
end

export JK_WRITE_ROOT='/Users/shami/go/src/github.com/shamisonn/shamisonn.github.io/_posts'
alias jkn="jk-write new"
alias jkcd="cd (jk-write root)"
function jkw -d "write jekyll post"
    eval "jk-write list -r | fzf --query (commandline)" | read -z select
    if not test -z $select
        eval "nvim (jk-write root)/(builtin string trim "$select")"
    end
    commandline -f repaint
end
function jkrm -d "remove jekyll post"
    eval "jk-write list -r | fzf --query (commandline)" | read -z select
    if not test -z $select
        eval "rm (jk-write root)/(builtin string trim "$select")"
    end
    commandline -f repaint	 
end
# alias
alias reload="source ~/.config/fish/config.fish"
if test (uname) = Darwin
    alias emacs="~/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
    alias rm="rmtrash"
    alias vim="nvim"
    alias vi="nvim"
end

