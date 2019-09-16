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

## Reproduction

When you change the base image from `node:8-alpine` to `node:8.9.4-alpine` it throws the above mentioned error.  
The only thing I found was the difference in the `/etc/alpine-version`:

- `node:8-alpine`: alpine version `3.9.4`
- `node:8.9.4-alpine`: alpine verion `3.6.2`
