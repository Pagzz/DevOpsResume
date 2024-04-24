# Use an official Nginx image
FROM nginx:alpine

# Copy the static content from the 'homepage' directory
COPY homepage/ /usr/share/nginx/html

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy the custom Nginx config from your 'config/nginx' directory
COPY nginx.conf /etc/nginx/conf.d/default.conf


# Expose port 80
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
