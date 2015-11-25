FROM raniemi/elixir_examples:latest

# Based on 
#  https://github.com/marcelocg/phoenix-docker
#  https://hub.docker.com/r/jamesbee/phoenix
MAINTAINER Ross Niemi <dev@lone-cyprus.com>

ENV DEBIAN_FRONTEND noninteractive

# install Phoenix from source with some previous requirements
ENV PHOENIX_VERSION 1.0.3
RUN git clone https://github.com/phoenixframework/phoenix.git \
 && cd phoenix && git checkout v$PHOENIX_VERSION \
 && mix local.hex --force && mix local.rebar --force \
 && mix do deps.get, compile \
 && mix archive.install https://github.com/phoenixframework/phoenix/releases/download/v$PHOENIX_VERSION/phoenix_new-$PHOENIX_VERSION.ez --force

# install Node.js and NPM in order to satisfy brunch.io dependencies
# the snippet below is borrowed from the official nodejs Dockerfile
# https://registry.hub.docker.com/_/node/

# gpg keys listed at https://github.com/nodejs/node
RUN set -ex \
  && for key in \
    9554F04D7259F04124DE6B476D5A82AC7E37093B \
    94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
    0034A06D9D9B0064CE8ADF6BF1747F4AD2306D93 \
    FD3A5288F042B6850C66B31F09FE44734EB7990E \
    71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
    DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
  ; do \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
  done

ENV NODE_VERSION 4.2.1
ENV NPM_VERSION 2.12.0
ENV NPM_CONFIG_LOGLEVEL info

RUN curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
 && curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
 && gpg --verify SHASUMS256.txt.asc \
 && grep " node-v$NODE_VERSION-linux-x64.tar.gz\$" SHASUMS256.txt.asc | sha256sum -c - \
 && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
 && rm "node-v$NODE_VERSION-linux-x64.tar.gz" SHASUMS256.txt.asc

RUN npm install -g npm@"$NPM_VERSION" \
 && npm cache clear

WORKDIR /code
