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
bind \cs cmds # bind C-s

function github -d "select ghq folders"
    cd (ghq root)/(ghq list | fzf)
end

# alias
alias reload="source ~/.config/fish/config.fish"
if test (uname) = Darwin
    alias emacs="~/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
    alias rm="rmtrash"
end



