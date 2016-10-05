#!/usr/bin/env bash

# based on https://hub.docker.com/r/tianon/steam/

#xhost +si:localuser:$(whoami) >/dev/null
xhost +
docker run \
    --privileged \
    --rm \
    -ti \
    -v /dev/dri:/dev/dri \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v /dev/shm:/dev/shm \
    -e DISPLAY=${DISPLAY} \
    -v /etc/localtime:/etc/localtime:ro \
    -v /var/lib/dbus/machine-id:/etc/machine-id \
    -v /tmp/pulse-twodQYLEAYXa/native:/tmp/pulse \
    -e PULSE_SERVER=unix:/tmp/pulse \
    -v $HOME/.steam:/home/steam \
    --name steam \
    tianon/steam /bin/bash -c 'sudo /etc/init.d/dbus start && steam'

    #tianon/steam /bin/bash
    #sassmann/ubuntu-steam
    #tianon/steam /bin/bash -c 'sudo /etc/init.d/dbus start && steam'
    #-v /run/user/$UID/pulse/native:/tmp/pulse \

    #-e PULSE_SERVER=unix:/tmp/pulse \
    #sassmann/ubuntu-steam bash
    #-v /run/user/$UID/pulse/native:/tmp/pulse \
    #-v /tmp/pulse-*/native:/tmp/pulse \

    #-v $HOME/.steam:/home/user \
    #andrey01/steam

    #-v $HOME/.steam:/home/steam \
    #sassmann/ubuntu-steam << OK
    #sudo /etc/init.d/dbus start && steam
    #tianon/steam steam << FUEN, but preferred

#xhost -si:localuser:$(whoami) >/dev/null
xhost -
