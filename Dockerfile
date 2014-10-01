FROM blacktop/bro:latest

MAINTAINER blacktop, https://github.com/blacktop

# Install Bro Required Dependencies
RUN apt-get -qq update && apt-get install -yq libpapi-dev libgoogle-perftools-dev
# RUN apt-get -y install gdb

# Setup environment.
ENV PATH $PATH:/usr/local/bro/bin:/opt/bro/aux/btest
ENV PATH $PATH:/opt/hilti/tools:/opt/hilti/build/tools::/opt/hilti/build/tools/pac-driver

# Put a small example in place.
WORKDIR /root
RUN ( echo 'module Test;'; echo; echo 'print "Hello, world!";' ) >hello-world.pac2

# Default to run upon container startup.
CMD hilti-config --version; bash

# Setup Bro
# RUN cd /opt && git clone --recursive git://git.bro.org/bro
# RUN cd /opt/bro && ./configure && make -j 5 && make install

# Setup HILTI.
ADD . /opt/hilti
RUN cd /opt/hilti && make -j 5 BRO_DIST=/opt/bro
