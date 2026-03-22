# Step 1: Build Stage
FROM node:18-alpine as build

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json .
RUN npm install

# Copy all files
COPY . .

# Build React app
RUN npm run build

# Step 2: Production Stage
FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html/

# Copy build files from previous stage
COPY --from=build /app/build .

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
