# Use an official Nginx image
FROM nginx:alpine

# Remove the default Nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy the static content from the 'homepage' directory
COPY homepage/ /usr/share/nginx/html

# Ensure homepage.html is renamed to index.html if it's your main page
# You can also do this directly in your source directory structure
RUN mv /usr/share/nginx/html/homepage.html /usr/share/nginx/html/index.html

# Copy images and PDFs
COPY images/ /usr/share/nginx/html/images
COPY PDF/ /usr/share/nginx/html/PDF

# Use the default Nginx configuration with modifications if necessary
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
