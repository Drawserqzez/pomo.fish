function __pomo -d "Simple pomodoro timer"
    function __print_help 
        echo "Usage $POMO_CMD [-hd] [work/break]"
        echo "      [-d | --duration] Changes the default duration for the activity. Ex '$POMO_CMD work --duration 10m"
        echo "      [-h | --help]     Prints this help!"
    end

    set -l options h/help d/duration=

    argparse -i $options -- $argv

    set -l operation $argv[1]

    if set -q _flag_help
        __print_help
        return 0
    else if ! contains -- $operation $POMO_VERBS
        echo "Invalid command! Please use one of following: $POMO_VERBS"
        return 69
    else if set -q _flag_duration
        echo "Changing $operation duration to $_flag_duration"

        if test $operation = $POMO_WORK_VERB
            set -U POMO_WORK $_flag_duration
        else if test $operation = $POMO_BREAK_VERB
            set -U POMO_BREAK $_flag_duration
        else
            echo "How did you even get here??"
            return 69
        end
    else 
        echo $operation
        echo "POMO_WORK: $POMO_WORK"
        echo "POMO_BREAK: $POMO_BREAK"
        echo "POMO_WORK_VERB: $POMO_WORK_VERB"
        echo "POMO_BREAK_VERB: $POMO_BREAK_VERB"
        echo "POMO_VERBS: $POMO_VERBS"
    end
end
