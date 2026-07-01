FROM node:22-slim

# Install build tools for better-sqlite3 native module
RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy package.json first for Docker layer caching
COPY package.json ./
RUN npm install

# Copy source code
COPY . .

# Create data directories
RUN mkdir -p data/uploads data/projects data/uploads/tmp

# Zeabur auto-injects PORT env var
EXPOSE 4567
ENV NODE_ENV=production

CMD ["node", "backend.js"]
