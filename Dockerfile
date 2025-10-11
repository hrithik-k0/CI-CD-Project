# Use official Node.js base image
FROM node:18

# Set working directory inside container
WORKDIR /app

# Copy app code into container
COPY app/ /app

# Install dependencies
RUN npm install

# Expose port for the app
EXPOSE 3030

# Start the app
CMD ["node", "index.js"]
