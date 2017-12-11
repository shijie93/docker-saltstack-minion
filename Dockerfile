FROM ubuntu:14.04
# based on the ubuntu:14.04

LABEL maintainer="15195895699@163.com"

# expose the salt port
EXPOSE 4505 4506

RUN echo "begin to install the salt-minion" \
    \
    && apt-get update \
    \
    # install the salt-minion
    && apt-get install -y salt-minion \
    \
    # clean the apt action and tmp
    && echo "salt-minion installed,do some clean" \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

# use the local config
ADD minion /etc/salt/

# start the salt-minion
CMD /usr/bin/salt-minion -d; /bin/bash 
