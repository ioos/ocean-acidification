FROM node:13.7.0-alpine
LABEL maintainer="devops@rpsgroup.com"

RUN apk update && \
    apk add yarn && \
    rm -rf /var/cache/apk/*

COPY bin /opt/ocean-acidification/bin
COPY public /opt/ocean-acidification/public
COPY routes /opt/ocean-acidification/routes
COPY views /opt/ocean-acidification/views
COPY app.js package.json /opt/ocean-acidification/

WORKDIR /opt/ocean-acidification
RUN yarn

# don't run as root
USER node

ENV NODE_ENV production

CMD ["bin/www"]
