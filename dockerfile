# Use an official Nginx image
FROM nginx:alpine

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy the static content from the 'homepage' directory
COPY homepage/ /usr/share/nginx/html

# Copy images and PDFs if they need to be directly accessible
COPY images/ /usr/share/nginx/html/images
COPY PDF/ /usr/share/nginx/html/PDF

# Copy the main Nginx config file into place
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the server configuration into the conf.d directory
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
