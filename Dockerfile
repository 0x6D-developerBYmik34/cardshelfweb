FROM node:latest as build

#ENV NODE_ENV=production

WORKDIR /app

COPY package.json ./
COPY package-lock.json ./
RUN rm package-lock.json
RUN npm install -g npm@10.2.0
RUN npm install
RUN npm i vite
COPY . ./
RUN npm run build


FROM node:19-alpine3.16

WORKDIR /app
COPY --from=build /app .


ENV HOST=0.0.0.0
EXPOSE 4173
CMD ["npm","run", "preview","--", "--host", "0.0.0.0"]
