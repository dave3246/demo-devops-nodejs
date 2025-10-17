FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

FROM node:18-alpine
WORKDIR /app

COPY --from=builder /app /app

RUN mkdir -p /app/data && \
    chown -R node:node /app/data

ENV NODE_ENV=production
ENV DATABASE_NAME=/app/data/dev.sqlite
EXPOSE 8000

HEALTHCHECK CMD curl --fail http://localhost:8000/api/users || exit 1
CMD ["node", "index.js"]