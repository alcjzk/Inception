if [ ! -f "wp-config.php" ]; then

sleep 1

    wp config create \
        --allow-root \
        --dbname="${DB_WP_DATABASE}" \
        --dbuser="${DB_WP_USER}" \
        --dbpass="${DB_WP_PASS}" \
        --dbhost="${DB_HOST}"

    wp core install \
        --allow-root \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PASS}" \
        --admin_email="${WP_ADMIN_EMAIL}" \
        --title="${WP_TITLE}" \
        --url="${DOMAIN}"

    wp user create ${WP_USER} ${WP_EMAIL} \
        --allow-root \
        --user_pass=${WP_PASS}
fi

exec php-fpm82
