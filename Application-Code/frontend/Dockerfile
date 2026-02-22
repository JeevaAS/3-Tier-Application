# ---------- Stage 1: Build the frontend ----------
FROM node:18 AS build

WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Enable legacy OpenSSL provider to fix ERR_OSSL_EVP_UNSUPPORTED
ENV NODE_OPTIONS=--openssl-legacy-provider

# Copy source code and build
COPY . .
RUN npm run build


# ---------- Stage 2: Serve with Nginx ----------
FROM nginx:alpine

# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy build output to nginx directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
