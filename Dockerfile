FROM node:8-alpine
# FROM node:8.9.4-alpine

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true" \
  CHROME_DEPS="nss@edge chromium@edge freetype@edge harfbuzz@edge" \
  CHROME_BIN="/usr/bin/chromium-browser"

RUN echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
  echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
  apk update && \
  apk upgrade && \
  apk --update --no-cache add ${CHROME_DEPS}

ADD index.js package.json /app/

RUN echo Alpine version: $(cat /etc/alpine-release) && \
  echo node $(node --version) && \
  echo yarn $(yarn --version) && \
  cd /app && yarn install

WORKDIR /app
ENTRYPOINT [ "node", "index.js" ]