FROM node:20-slim
WORKDIR /app

# better-sqlite3 需要编译工具
RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*

COPY package*.json ./
RUN npm ci --omit=dev
COPY . .
RUN mkdir -p data/uploads data/projects data/uploads/tmp

EXPOSE 4567
ENV NODE_ENV=production
ENV PORT=4567

HEALTHCHECK --interval=30s --timeout=3s CMD curl -f http://localhost:${PORT}/ || exit 1

CMD ["node", "backend.js"]
