FROM php:7.0-apache  
ENV PORT 8080
COPY . /var/www/html
RUN sed -i "s/80/$PORT/g" /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf
EXPOSE 8080
ENTRYPOINT ["docker-php-entrypoint"]
CMD ["apache2-foreground"]
