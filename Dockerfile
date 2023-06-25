FROM node:18-alpine as  builder

WORKDIR /home/node/app

COPY --chown=node:node ./package.json ./

RUN npm install

COPY --chown=node:node ./ ./

RUN  npm run build

#all stuff we have will be inside /home/node/app/build folder

FROM nginx 

COPY --from=builder /home/node/app/build  /usr/share/nginx/html

