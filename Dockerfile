FROM ggrandes/ubuntu32:14.04

RUN apt-get update

RUN apt-get install -y \
    cups \
    vim \
    wget \
    whois && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY cupsd.conf /etc/cups/

RUN wget http://download.brother.com/welcome/dlf101546/hl1210wcupswrapper-3.0.1-1.i386.deb && \
    dpkg -i hl1210wcupswrapper-3.0.1-1.i386.deb && \
    rm hl1210wcupswrapper-3.0.1-1.i386.deb && \
    wget http://download.brother.com/welcome/dlf101547/hl1210wlpr-3.0.1-1.i386.deb && \
    dpkg -i hl1210wlpr-3.0.1-1.i386.deb && \
    rm hl1210wlpr-3.0.1-1.i386.deb

EXPOSE 631

ADD start_cups.sh /root/start_cups.sh
RUN chmod +x /root/start_cups.sh

CMD ["/root/start_cups.sh"]
