FROM kalilinux/kali-linux-docker
MAINTAINER boogy "linuxhackk@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

ADD ./run.sh /run.sh

# Install metasploit
RUN apt-get -y update ; apt-get -y dist-upgrade ; apt-get -y install ruby metasploit-framework

ENTRYPOINT ["/run.sh"]

CMD ["metasploit"]
