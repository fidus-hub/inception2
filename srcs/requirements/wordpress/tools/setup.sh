DIR="/var/www/html/";

echo "$DIR is Empty \n Copying wordpress..."
cp -r wordpress/* $DIR
echo "Modifying wp-config file"

sed -i 's/database_name_here/'$DBNAME'/g' /var/www/html/wp-config.php
sed -i 's/username_here/'$DBUSER'/g' /var/www/html/wp-config.php
sed -i 's/password_here/'$DBPASS'/g' /var/www/html/wp-config.php

chmod -R 777 $DIR
chown -R www-data /var/www/html
mv .conf /etc/php/7.3/fpm/pool.d/www.conf
service php7.3-fpm start
service php7.3-fpm stop
echo "Starting php7.3-fpm in the foreground"
php-fpm7.3 -F -R
