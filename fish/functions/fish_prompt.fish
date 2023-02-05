function fish_prompt
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
    set -l normal (set_color normal)
    set -q fish_color_status
    or set -g fish_color_status red

    # Color the prompt differently when we're root
    set -l color_cwd $fish_color_cwd
    set -l suffix '>'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

    # Write pipestatus
    # If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
    set -l bold_flag --bold
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
    end
    set __fish_prompt_status_generation $status_generation
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $bold_flag $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')
    if set -q git_branch[1]
        set -l git_color (set_color green)
        set git_branch git::$git_branch
        set -l git_status (git status --porcelain 2> /dev/null)
        if test (count $git_status) -gt 0
            # Add an asterisk if the repository is modified
            set -l __red_asterisk (set_color red)"*"
            set git_branch (echo -n -s $git_color [ "$git_branch $__red_asterisk" $git_color ] )
        else
            set git_branch (echo -n -s $git_color [ "$git_branch" $git_color ] )
        end
    end

    set -l pwd_color (set_color blue)
    set -l info_color (set_color grey)
    set -l git_color (set_color green)

    echo -n -s $pwd_color (pwd)
    echo -n -s " "$git_branch
    echo -n -s $info_color " "[(whoami)@(prompt_hostname)]
    echo -s $info_color " "[(date +%H:%M)]
    echo -n -s $normal $prompt_status $suffix" "
end
