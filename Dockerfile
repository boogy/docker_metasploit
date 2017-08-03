FROM kalilinux/kali-linux-docker
MAINTAINER boogy "linuxhackk@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

ADD ./run.sh /run.sh

# Install metasploit
RUN grep "kali-rolling main contrib non-free" /etc/apt/sources.list \
    || echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list

RUN apt-get -y update ; apt-get -y dist-upgrade ; apt-get -y install ruby metasploit-framework

ENTRYPOINT ["/run.sh"]
CMD ["start_msf"]
