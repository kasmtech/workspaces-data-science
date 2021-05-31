#!/bin/bash
# Best effort atempt to wait until XFCE is loaded before creating the users
#   If the adduser command is executed before the desktop is loaded the users will get an error "The notification area lost selection"

function go() {
    adduser $KASM_USER --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password --force-badname
    echo "$KASM_USER:password" | sudo chpasswd
    rstudio-server start &
}

i="0"
while [ $i -lt 5 ]
    do
        if pgrep xfce > /dev/null
        then
            go
            exit 0
        fi
        sleep 1
        i=$[$i + 1]
    done

# Go ahead and run the commands anyway.
go
