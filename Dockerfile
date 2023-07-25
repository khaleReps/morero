# Use the official PHP Docker image as the base image
FROM php:7.4-apache

# Set working directory
WORKDIR /var/www/html

# Enable Apache Rewrite Module
RUN a2enmod rewrite

# Install PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Install MySQL server
RUN apt-get update && apt-get install -y default-mysql-server

# Copy the PHP-MVC app files to the container
COPY morero/ /var/www/html/

# Expose port 83 for Apache
EXPOSE 83

# Expose port 3307 for MySQL
EXPOSE 3307

# Start the Apache server and MySQL
CMD ["bash", "-c", "service apache2 start && service mysql start && tail -f /dev/null"]
