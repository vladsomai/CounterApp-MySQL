#RUN FIRST TIME YOU INSTALL DB
create database counterdb;
SET GLOBAL log_bin_trust_function_creators = 1;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '3ng1n33r';
flush privileges;

#USE THE BELOW COMMAND TO CREATE THE PROCEDURES AFTER FIRST TIME INSTALL
#SET SQL_SAFE_UPDATES = 0;

#for changing mysql bind addresses
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf

#allow all clients to connect to database with user root
mysql> CREATE USER 'root'@'%' IDENTIFIED BY 'PASSWORD';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
mysql> FLUSH PRIVILEGES;