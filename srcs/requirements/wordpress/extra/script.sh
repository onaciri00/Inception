#!/bin/bash


sleep 10

chmod 777 wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

mkdir /var/www/html/wordpress


#is it necessary>>No according to chatgpt hence whene you download php-fpm you get it configure and run
mkdir -p /run/php


cd /var/www/html/wordpress

#to download wordpress core files to the cuurent directory 
#the --allow-root make it so it can have root prevlige
#didn't need them(root prevlige) for download cuase it's not required to install files
#but need them in case of modifing some files later
wp core download --allow-root


#to create a confg file(wp-config.php) for wordpress it configure how wrdpress should connect  to mariadb(any database)
#Note: if not used now the next command will ask for those information(cause it will try to create this file)
wp core config --dbname=${MYSQL_DB} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PW} --dbhost=mariadb --allow-root

#you might wonder why is this command necessary whene you already have "wp core download"
#well cause the first command only bring the files doesn't set-up anything or configure anything
#while this can bring(core file for wordpress) and install it while also giving you prompt to configure as explained
#if not for this bieng a script<you don't have promt and not practal > Iwill
#is used to set up a new WordPress installation.<anything before will be lost in case of repeated install in same directory>
#


wp core install --allow-root --url=onaciri.42.fr --title=Inception --admin_user=${WP_USER} --admin_password=${WP_PW} --admin_email=${WP_EMAIL}


#it create A user with this option username user email then password
wp user create --allow-root ${WP_USER_NAME} ${WP_USER_EMAIL} --user_pass="${WP_USER_PASSWORD}"



#first lets know who are "www-data" they are running proccess wich represent nginx<any webserver>
#thar mean that for the user www-data that exist in the group www-data whta premissino do they have that what we care about now 
#chown -R is command that change ownership of file/directory the option -R is to make all files and subdirectories
#change prmission as well
#www-data:www-data this is the user and group that will have the premission chnged for
#/var/www/html/wordpress This is the directory path for which ownership is being changed.
#simply put the premission stay the same only nginx that become root 
chown -R www-data:www-data /var/www/html/wordpress

#what is new in this case is that the g option make change for all accuret<ook the same> in the file 
#/run/php/php7.4-fpm.sock this make it listen to unix domain socket while we want it to listen to TCP/IP<all ip address from port9000>
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.4/fpm/pool.d/www.conf


# this make it change the directory whene running cgi script in case something is need for that script 
#n the case of WordPress or other content management systems (CMS), PHP scripts often need to access files located within the CMS's installation directory.
#By configuring PHP-FPM to set the working directory to the CMS's root directory (e.g., /var/www/html/wordpress for WordPress)
#you ensure that PHP scripts executed by PHP-FPM have access to the CMS's files and resources.
sed -i 's|chdir = /var/www|chdir = /var/www/html/wordpress|g' /etc/php/7.4/fpm/pool.d/www.conf


#this command start php-fpm((PHP FastCGI Process Manager) versin 7.4
#option -F make it run in the foreground to make dockerfile able to show error and for debugging purpose


php-fpm7.4  -F