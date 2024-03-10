# FROM node:20

# WORKDIR /app

# COPY . .

# RUN npm install
# RUN npx prisma generate
# RUN npm run build

# EXPOSE 3000

# CMD ["node", "dist/index.js"]
FROM node:20

WORKDIR /usr/src/app

COPY package* .
COPY ./prisma .
    
RUN npm install
RUN npx prisma generate

COPY . .
RUN npm run build
EXPOSE 3000

CMD ["node", "dist/index.js", ]