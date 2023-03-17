function __pomo.track -d "Tracks how long you've worked"
    set -f now (date +%s)
    set -f diff (math (math $now - $POMO_STARTED) / 60)
    set -f day (date +%D)

    echo "$day - $diff seconds" >> $POMO_DATA 

    echo "Great job, you worked for approx. $diff seconds!"
end
