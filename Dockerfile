FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .
RUN mkdir -p data/uploads data/projects data/uploads/tmp
EXPOSE 4567
ENV NODE_ENV=production
ENV PORT=4567
HEALTHCHECK --interval=30s --timeout=3s CMD curl -f http://localhost:4567/ || exit 1
CMD ["node", "backend.js"]
