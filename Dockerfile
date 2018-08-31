FROM debian:jessie
MAINTAINER Robert Fratantonio <Robert.Fratantonio@rpsgroup.com>

ENV NODE_VERSION 7.9.0
ENV GOSU_VERSION 1.9
ENV SCRIPTS_DIR /opt/build_scripts

RUN mkdir -p $SCRIPTS_DIR
RUN useradd -m node

COPY contrib/scripts/ $SCRIPTS_DIR/

RUN $SCRIPTS_DIR/install-deps.sh
RUN $SCRIPTS_DIR/install-node.sh
COPY bin /opt/ocean-acidification/bin
COPY public /opt/ocean-acidification/public
COPY routes /opt/ocean-acidification/routes
COPY views /opt/ocean-acidification/views
COPY .bowerrc app.js bower.json package.json /opt/ocean-acidification/

WORKDIR /opt/ocean-acidification
RUN chown -R node:node /opt/ocean-acidification
USER node
RUN npm install && \
    node_modules/bower/bin/bower install

ENV NODE_ENV production

CMD ["bin/www"]
