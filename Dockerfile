FROM node:16

# Create app directory
WORKDIR /usr/src/app

# Install dependencies
COPY package-lock.json ./
COPY package.json ./
RUN npm install

# Copy source
COPY . .

EXPOSE 8888
CMD [ "node", "app.js" ]