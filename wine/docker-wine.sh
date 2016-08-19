#!/usr/bin/env bash

# fomr https://hub.docker.com/r/yantis/wine/

#xhost +si:localuser:$(whoami) >/dev/null
#ip=`hostname`
ip=192.168.81.148
xhost + $ip
    #-e DISPLAY \
docker run \
    --privileged \
    --rm \
    -ti \
    -e DISPLAY=$ip:0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v ~/.docker_shared/wine:/home/docker/.wine/ \
    -v /etc/localtime:/etc/localtime:ro \
    -u docker \
    yantis/wine /bin/bash -c "sudo initialize-graphics >/dev/null 2>/dev/null; bash"
    #yantis/wine /bin/bash -c "sudo initialize-graphics >/dev/null 2>/dev/null; vglrun /home/docker/templates/skype.template;"

#xhost -si:localuser:$(whoami) >/dev/null
xhost - $ip
