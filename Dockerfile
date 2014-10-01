FROM blacktop/bro:latest

MAINTAINER blacktop, https://github.com/blacktop

# Install Bro Required Dependencies
RUN apt-get -qq update && apt-get install -yq libpapi-dev libgoogle-perftools-dev
# RUN apt-get -y install gdb

# Compile and install LLVM/clang
ENV PATH /opt/llvm/bin:$PATH
RUN  \
  git clone https://github.com/rsmmr/install-clang.git && \
  /install-clang/install-clang -j 4 -C /opt/llvm

# Setup HILTI.
ENV PATH $PATH:/usr/local/bro/bin:/nsm/bro/aux/btest
ENV PATH $PATH:/hilti/tools:/hilti/build/tools::/hilti/build/tools/pac-driver
RUN  \
  git clone git://www.icir.org/hilti && \
  cd hilti && make -j 5 BRO_DIST=/nsm/bro && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Put a small example in place.
WORKDIR /root
RUN ( echo 'module Test;'; echo; echo 'print "Hello, world!";' ) >hello-world.pac2

CMD hilti-config --version; bash
