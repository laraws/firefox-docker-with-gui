FROM ubuntu:bionic

ARG CHANGE_SOURCE=false

RUN if [ ${CHANGE_SOURCE} = true ] ; then \
     cp /etc/apt/sources.list /etc/apt/sources.list.bak && \
     sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list && \
     sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list \
;fi

RUN apt update && apt install firefox -y

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog

CMD ["/usr/bin/firefox"]