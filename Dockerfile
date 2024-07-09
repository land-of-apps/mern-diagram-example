# Use a Node.js base image
FROM node:18.19.0

# Create app directory
WORKDIR /app

# Install global dependencies
RUN npm install -g npm@latest

# Copy client and server package.json files and install dependencies
COPY client/package*.json client/
COPY server/package*.json server/
RUN cd client && npm install
RUN cd server && npm install

# Copy all necessary files
COPY . .


# Expose ports
EXPOSE 8080

# Start both the client and server
CMD [ "npx", "appmap-node@latest", "npm", "run", "dev" ]
