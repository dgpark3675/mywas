FROM php:8.2-fpm

# MariaDB 연동을 위한 확장 설치
RUN docker-php-ext-install mysqli pdo pdo_mysql

# 데이터베이스 환경 변수 선언
ENV DB_HOST=database.cdyykgyowiim.ap-northeast-2.rds.amazonaws.com \
    DB_USER=admin \
    DB_PASSWORD=1q2w3e4r! \
    DB_NAME=mydb

WORKDIR /var/www/html

# PHP 소스코드 복사
COPY ./src /var/www/html

# 권한 설정 (필요시)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# PHP-FPM 포트 확인 (기본 9000)
EXPOSE 9000

