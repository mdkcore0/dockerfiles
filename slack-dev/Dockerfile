# based on https://hub.docker.com/r/roninkenji/slackware-base
FROM vbatts/slackware:14.2
MAINTAINER mdkcore

RUN echo "http://linorg.usp.br/slackware/slackware64-14.2/" > /etc/slackpkg/mirrors
RUN sed -i -e 's/^WGETFLAGS=.*/WGETFLAGS="--passive-ftp --no-verbose"/' /etc/slackpkg/slackpkg.conf
RUN slackpkg -batch=on -default_answer=yes update && slackpkg -batch=on -default_answer=yes upgrade-all

# Upgrading CA-certificates
RUN slackpkg -batch=on -default_answer=yes install ca-certificates && ( cd /etc/ssl/certs; grep -v '^#' /etc/ca-certificates.conf | while read CERT; do ln -fsv /usr/share/ca-certificates/$CERT `basename ${CERT/.crt/.pem}`; ln -fsv /usr/share/ca-certificates/$CERT `openssl x509 -hash -noout -in /usr/share/ca-certificates/$CERT`.0; done )

# Set default LANG to en_US.UTF-8
RUN ( echo export LANG=en_US.UTF-8; echo export LC_COLLATE=C ) > /etc/profile.d/lang.sh
RUN ( echo export LANG=en_US.UTF-8; echo export LC_COLLATE=C ) > /etc/profile.d/lang.zsh

# now my things
COPY slackpkg/min.template /etc/slackpkg/templates

RUN slackpkg -batch=on -default_answer=yes install-template min
RUN slackpkg -batch=on -default_answer=yes install zsh tmux htop curl git-2 vim-7.4 tig
# TODO add my own repo to install things

RUN useradd docker -u 501 -s /bin/zsh --no-create-home
RUN echo '%docker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

VOLUME ["/home/docker"]

USER docker
WORKDIR /home/docker

ENV HOME /home/docker
ENV TERM tmux-256color

ADD ./scripts/initialize.sh /opt/

# keep this container running
CMD ["/usr/bin/tail", "-f", "/dev/null"]
