# Use an official Nginx image
FROM nginx:alpine

# Remove the default Nginx configuration files
RUN rm /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/nginx.conf

# Copy the static content from the 'homepage' directory
COPY homepage/ /usr/share/nginx/html

# Copy images and PDFs if they need to be directly accessible
COPY images/ /usr/share/nginx/html/images
COPY pdf/ /usr/share/nginx/html/pdf

# Copy the main Nginx configuration and server block configuration
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
