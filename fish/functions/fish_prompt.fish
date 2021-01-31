# set -l right_triangle \ue0b0
# set segment_separator $right_triangle

set color_user
set color_git_status_bar

function _segment
    set_color -b $argv[1] $argv[2]
    echo -n " "
end

function _prompt_dir
    printf ' %s ' (pwd)
    _segment $color_user $color_dark
end

function _prompt_user
    printf '%s ' (set_color $white)(whoami)

    if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        _change_color_git_status_bar
        _segment $color_git_status_bar $color_user;
    else
        _segment normal $color_user
    end
end

function _prompt_nl
    printf '\n'
end

function _change_color_git_status_bar
    if [ (_is_git_dirty) ]; set color_git_status_bar $color_git_dirty
    else; set color_git_status_bar $color_git_main; end
end

function _is_git_dirty
    echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function _prompt_git
    if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set -l git_branch (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
        _change_color_git_status_bar
        set_color -b $color_git_status_bar
        printf '%s ' (set_color $black)$git_branch
        _segment normal $color_git_status_bar
    end
end


function fish_prompt
    set -l last_status $status
    set_color -b $color_dark $white
    if [ $last_status -gt 0 ]
        set color_user $color_warning
    else
        set color_user $color_main
    end
		_prompt_nl
    _prompt_dir
    _prompt_user
    _prompt_git
end
