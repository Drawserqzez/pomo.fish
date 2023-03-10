function __pomo.timer -d "Timer function"
    if not test (count $argv) -gt 0; 
        echo "timer: Missing duration!"
        return;
    end;

    if not test (math $argv[1] + 1 2>/dev/null) -gt 0;
        echo "timer: Faulty duration"
        return;
    end;

    set duration $argv[1];

    argparse --max-args 1 'min' -- $argv 
    or return

    if set -q _flag_min;
        set duration (math $duration x 60); 
    end;

    set secs $duration;
    set now (date +%s);
    set start (math $now + $secs);
    set last_set $start;

    while test $start -ge (date +%s); 
        set time (math $start - (date +%s))

        if test $last_set -gt (math $time + 0.3);
            set_color (random choice (set_color -c)) --bold
            set last_set $time
        end

        echo -n -e "Time left ->" (date -u -d @$time +%T)\r
    end

end
