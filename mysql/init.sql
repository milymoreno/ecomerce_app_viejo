#CREATE USER 'root'@'localhost' IDENTIFIED BY 'admin';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;