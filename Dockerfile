FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .
RUN mkdir -p data/uploads data/projects data/uploads/tmp
EXPOSE 4567
ENV NODE_ENV=production
CMD ["node", "backend.js"]
