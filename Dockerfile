FROM php:8.2-fpm

# MariaDB 연동을 위한 확장 설치
RUN docker-php-ext-install mysqli pdo pdo_mysql
ENV DB_HOST: database.cdyykgyowiim.ap-northeast-2.rds.amazonaws.com
ENV DB_USER: admin
ENV DB_PASSWORD: 1q2w3e4r!
ENV DB_NAME: mydb

WORKDIR /var/www/html

# PHP 소스코드 복사
COPY ./src /var/www/html

# 권한 설정 (필요시)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# PHP-FPM 포트 확인 (기본 9000)
EXPOSE 9000

