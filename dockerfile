# Use an official Nginx image
FROM nginx:alpine

# Copy the static content from the 'homepage' directory
COPY homepage/ /usr/share/nginx/html

# Copy the main Nginx config file into place
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the server configuration into the conf.d directory
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
