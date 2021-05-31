FROM node:lts-alpine3.13
ENV NODE_ENV=production
ENV DISABLE_OPENCOLLECTIVE=true
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
COPY src ./
