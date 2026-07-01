FROM node:20-slim
WORKDIR /app

# Install build tools for native modules (better-sqlite3)
RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*

# Copy everything and install
COPY . .
RUN npm install
RUN mkdir -p data/uploads data/projects data/uploads/tmp

EXPOSE 4567
ENV NODE_ENV=production
ENV PORT=4567

CMD ["node", "backend.js"]
