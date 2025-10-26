# Gunakan Nginx sebagai web server
FROM nginx:alpine

# Copy file HTML ke direktori default Nginx
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Nginx akan jalan otomatis sebagai default command