if test -z $POMO_CMD
    set -U POMO_CMD pomo
end

if test -z $POMO_WORK_VERB
    set -U POMO_WORK_VERB work
end

if test -z $POMO_BREAK_VERB
    set -U POMO_BREAK_VERB break
end

if test -z $POMO_WORK
    set -U POMO_WORK 30m
end

if test -z $POMO_BREAK 
    set -U POMO_BREAK 10m
end

if set -q $POMO_VERBS
    set -U POMO_VERBS $POMO_WORK_VERB $POMO_BREAK_VERB
end

if test ! -z $POMO_CMD 
    function $POMO_CMD -d "Small pomodoro timer"
        __pomo $argv
    end
end

function __pomo_on_break --on-variable POMO_BREAK_VERB
    __pomo_set_verbs
end

function __pomo_on_work --on-variable POMO_WORK_VERB
    __pomo_set_verbs
end

function __pomo_set_verbs
    set -U POMO_VERBS $POMO_BREAK_VERB $POMO_WORK_VERB
end

function __pomo_uninstall --on-event pomo_uninstall
    functions -e $POMO_CMD
    functions -e __pomo_on_break
    functions -e __pomo_on_work
    functions -e __pomo_set_verbs

    set -e $POMO_CMD

    set -e $POMO_VERBS
    set -e $POMO_WORK_VERB
    set -e $POMO_BREAK_VERB

    set -e $POMO_WORK
    set -e $POMO_BREAK
end
