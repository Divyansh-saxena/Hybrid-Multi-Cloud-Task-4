#! /bin/bash
sudo yum update -y
sudo yum install docker -y
sudo service docker start
echo WORDPRESS_DB_HOST = mysqlDB > my-env.txt
echo WORDPRESS_DB_PASSWORD = mysqlPass >> my-env.txt
sudo firewall-cmd --zone=public --add-masquerade --permanent
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --zone=public --add-port=443/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8000/tcp --permanent
sudo firewall-cmd --reload
sudo service docker restart
sudo docker run -dit -p 8000:80 --env-file my-env.txt wordpress:4.8-apache
