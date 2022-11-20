
#https://learn.microsoft.com/en-us/visualstudio/docker/tutorials/docker-tutorial


Persist your todo data using named volumes
===========================================

docker volume create todo-db

docker run -dp 3000:3000 -v todo-db:/etc/todos getting-started


Use bind mounts
===============

docker run -dp 3000:3000 -w /app -v ${PWD}:/app node:12-alpine sh -c "yarn install && yarn run dev"


MySQL Database
==============

docker network create todo-app

Start a MySQL container and attach it the network.

docker run -d 
    --network todo-app --network-alias mysql 
    -v todo-mysql-data:/var/lib/mysql 
    -e MYSQL_ROOT_PASSWORD=<your-password> 
    -e MYSQL_DATABASE=todos 
    mysql:5.7

docker exec -it <mysql-container-id> mysql -p

SHOW DATABASES;

docker run -dp 3000:3000 
  -w /app -v ${PWD}:/app 
  --network todo-app 
  -e MYSQL_HOST=mysql 
  -e MYSQL_USER=root 
  -e MYSQL_PASSWORD=<your-password> 
  -e MYSQL_DB=todos 
  node:12-alpine 
  sh -c "yarn install && yarn run dev"

docker exec -ti <mysql-container-id> mysql -p todos

select * from todo_items;

docker run -d 
  --network todo-app --network-alias mysql 
  -v todo-mysql-data:/var/lib/mysql 
  -e MYSQL_ROOT_PASSWORD=<your-password> 
  -e MYSQL_DATABASE=todos 
  mysql:5.7