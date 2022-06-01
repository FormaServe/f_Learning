#!/QOpenSys/pkgs/bin/bash

## output todays
get_current_date() {
    echo $1
    date $1
}

# execute function
get_current_date "+%Y-%m-%d"

