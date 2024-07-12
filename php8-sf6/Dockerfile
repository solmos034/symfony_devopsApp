# utilisation de l'image php de base 8.0.13-cli 
FROM php:8.0.13-cli

# installation des dépendances nécessaires pour une application symfony
RUN apt-get update \
    &&  apt-get install -y --no-install-recommends \
        locales apt-utils git libicu-dev g++ libpng-dev libxml2-dev libzip-dev libonig-dev libxslt-dev unzip libpq-dev nodejs npm wget \
        apt-transport-https lsb-release ca-certificates

# configuration des paramètres régionaux pour les langues anglaise et française
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen  \
    &&  echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen \
    &&  locale-gen

# installation de Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
    &&  mv composer.phar /usr/local/bin/composer

# installation de l'outil de ligne de commande symfony
RUN curl -sS https://get.symfony.com/cli/installer | bash \
    &&  mv /root/.symfony5/bin/symfony /usr/local/bin

# installation des extensions PHP essentielles pour une application Symfony
RUN docker-php-ext-configure \
            intl \
    &&  docker-php-ext-install \
            pdo pdo_mysql pdo_pgsql opcache intl zip calendar dom mbstring gd xsl

# installation et activation de l'extension APCu -> améliorer les performances de votre application Symfony
RUN pecl install apcu && docker-php-ext-enable apcu

# installation de Yarn gestionnaire de paquets pour nodejs
RUN npm install --global yarn

# configuration d'un utilisateur Git avec un email et username
RUN git config --global user.email "salmahamidallah1@gmail.com" \
    &&  git config --global user.name "salmahamidallah"

# Copiez le script d'entrée
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# définition du script d'entrée
ENTRYPOINT ["entrypoint.sh"]

# Définition du répertoire de travail par défaut où on place l'application
WORKDIR /var/www/html/

# exécuter le conteneur indéfiniment
CMD ["tail", "-f", "/dev/null"]
