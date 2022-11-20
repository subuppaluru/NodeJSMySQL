FROM node:12-alpine
WORKDIR /app
COPY package.json yarn.lock ./
COPY . .
RUN yarn install --production
CMD ["node", "/app/src/index.js"]