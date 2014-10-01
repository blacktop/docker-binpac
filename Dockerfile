FROM blacktop/bro:latest

MAINTAINER blacktop, https://github.com/blacktop

# Install Required Dependencies
RUN apt-get -qq update && apt-get install -yq libpapi-dev libgoogle-perftools-dev
# RUN apt-get -y install gdb

# Compile and install LLVM/clang
ENV PATH /opt/llvm/bin:$PATH
RUN  \
  cd /opt && \
  git clone https://github.com/rsmmr/install-clang.git && \
  /opt/install-clang/install-clang -C /opt/llvm && \
  rm -rf /install-clang

# Setup HILTI.
ENV PATH $PATH:/usr/local/bro/bin:/nsm/bro/aux/btest
ENV PATH $PATH:/opt/hilti/tools:/opt/hilti/build/tools::/opt/hilti/build/tools/pac-driver
RUN  \
  cd /opt && \
  git clone git://www.icir.org/hilti && \
  cd hilti && make BRO_DIST=/nsm/bro && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Put a small example in place.
WORKDIR /root
RUN ( echo 'module Test;'; echo; echo 'print "Hello, world!";' ) >hello-world.pac2

CMD hilti-config --version; bash
