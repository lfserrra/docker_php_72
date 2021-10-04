FROM php:7.2.1-fpm
MAINTAINER "https://github.com/lfserrra"

# New sources
RUN apt-get update
RUN apt-get install -y curl apt-transport-https
RUN apt-get install -my wget gnupg
RUN curl https://packages.microsoft.com/keys/microsoft.asc | iconv -f windows-1251 | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/8/prod.list > /etc/apt/sources.list.d/mssql-release.list

# install SQL Server drivers
RUN apt-get update && ACCEPT_EULA=Y apt-get install -y unixodbc-dev msodbcsql && ACCEPT_EULA=Y apt-get install -y mssql-tools

# Install libxml2
RUN apt-get update && apt-get install -y \
        libxml2 libxml2-dev

RUN wget http://ftp.br.debian.org/debian/pool/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u8_amd64.deb
RUN dpkg -i libssl1.0.0_1.0.1t-1+deb8u8_amd64.deb

# Install php extensions
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
    && docker-php-ext-install -j$(nproc) iconv mbstring pdo_mysql soap \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

# Install msodbcsql
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql

# Install sqlsrv
RUN pecl install sqlsrv pdo_sqlsrv
RUN docker-php-ext-enable sqlsrv pdo_sqlsrv

# install necessary locales
RUN apt-get install -y locales \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen

# Install git, unzip and wget
RUN apt-get install -y git unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer

RUN chmod +x /opt/microsoft/msodbcsql/lib64/libmsodbcsql-13.1.so.9.2

WORKDIR /usr/share/nginx/html
