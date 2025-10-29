FROM node:alpine3.20

WORKDIR /tmp

COPY . .

EXPOSE 3000/tcp

RUN apk update
RUN apk upgrade
RUN apk add --no-cache openssl curl gcompat iproute2 coreutils bash
RUN chmod +x index.js
RUN npm install


CMD ["node", "index.js"]
