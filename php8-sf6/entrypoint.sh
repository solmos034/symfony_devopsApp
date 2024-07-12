#!/bin/bash
set -e

# Si un répertoire de projet Symfony n'existe pas, créez-le
if [ ! -d /var/www/html/new-project ]; then
    cd /var/www/html
    symfony new new-project --full
fi

cd /var/www/html/new-project
symfony serve -d

# Exécute la commande par défaut
exec "$@"
