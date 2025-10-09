FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
ENV NODE_ENV=production
EXPOSE 8000


RUN mkdir -p /app/data && \
    chown -R node:node /app/data

ENV DATABASE_NAME=/app/data/dev.sqlite

HEALTHCHECK CMD curl --fail http://localhost:8000/api/users || exit 1
CMD ["node", "index.js"]
