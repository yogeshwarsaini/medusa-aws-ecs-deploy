# # Base image
# FROM node:18-alpine

# # Set working directory
# WORKDIR /app

# # Copy package files
# COPY package.json package-lock.json ./

# # Install dependencies using npm
# RUN npm install

# # Copy rest of the code
# COPY . .

# # Set environment variable for port
# ENV PORT=9000

# # Expose port for ECS/ALB
# EXPOSE 9000

# # Start Medusa server
# CMD ["npm", "start" , "run"]

# Base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy rest of the code
COPY . .

# Set environment variable for port
ENV PORT=9000

# Expose port
EXPOSE 9000

# Start Medusa server
CMD ["npx", "medusa", "develop"]
COPY .env .env
