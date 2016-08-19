dockerfiles
===========
A place for all my docker files

what is here
------------
* **slack-dev**: A dockerized work environment (Slack64 14.2).

MOAR
----
You can take a look on my [dotfiles](https://github.com/rodrigogolive/dotfiles) and [dotbins](https://github.com/rodrigogolive/dotbins) too ;)




# TODO 
based on:
https://github.com/roninkenji/slackware-full/blob/master/Dockerfile
https://hub.docker.com/r/roninkenji/slackware-base/~/dockerfile/

https://blog.docker.com/2013/07/docker-desktop-your-desktop-over-ssh-running-inside-of-a-docker-container/

files (min.lst, xapbase.lst, xbase.lst) from (plus slackpkg+):
git://bear.alienbase.nl/liveslak.git

HOW TO:
- build
    docker build --tag slack .

- run
    docker run -di -v /Volumes/home/rodrigo/.docker_shared/docker:/home/docker --name slack_docker slack
     docker run --privileged -di -v /Volumes/home/rodrigo/.docker_shared/docker:/home/docker --name slack_docker slack

-exec (enter):
    docker exec -ti slack_docker script /dev/null -c 'zsh'
