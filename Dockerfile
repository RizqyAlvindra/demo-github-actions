FROM node:14

WORKDIR lolrandom

COPY . .

RUN npm install

EXPOSE 3000

CMD [ "npm", "start" ]
