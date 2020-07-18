#! /bin/bash
sudo yum update -y
sudo yum install docker -y
sudo service docker start
echo MYSQL_ROOT_PASSWORD = RootPass > my-env.txt
echo MYSQL_DATABASE = mysqlDB >> my-env.txt
echo MYSQL_USER = mysqlUser >> my-env.txt
echo MYSQL_PASSWORD = mysqlPass >> my-env.txt
sudo firewall-cmd --zone=public --add-masquerade --permanent
sudo firewall-cmd --zone=public --add-port=3306/tcp --permanent
sudo firewall-cmd --zone=public --add-port=443/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
sudo service docker restart
sudo docker run -dit -p 8080:3306 --env-file my-env.txt mysql:5.6