# puppeteer error reproduction

I got the following error in my docker builds:

```bash
Error relocating /usr/lib/chromium/chrome: _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2ERKS4_mRKS3_: symbol not found
```

This is repo contains a reproduction for this error.

## Setup

run the following command to build and run the test docker image:

```bash
yarn build && yarn build:run
# OR
npm run build && npm run build:run
```

## Findings

If I build the docker image with `node:8-alpine` as base image, puppeteer seems to work. If I build the docker image with `docker:8.9.4-alpine` as base image tho, I get the error mentioned above.
