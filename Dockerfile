FROM node:18-alpine3.20

WORKDIR /tmp

# 先复制依赖文件
COPY package*.json ./

# 安装系统依赖和 npm 依赖
RUN apk update && apk upgrade && \
    apk add --no-cache bash curl openssl gcompat iproute2 coreutils python3 make g++ && \
    npm install --registry=https://registry.npmjs.org/

# 再复制项目源码
COPY . .

EXPOSE 3000

CMD ["node", "index.js"]

