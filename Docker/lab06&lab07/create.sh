#!/usr/bin/env bash


docker build -t todo-manager-img /home/krasi/Docker/app
docker volume create --name todo-vol

for i in $(seq 1 3) do 
    docker run -dp 300${i}:3000 --name todo-manager${i} \
    --mount source=todo-vol,target=/etc/todos todo-manager-img
done

crontab -l > crontab_backup
echo "0 * * * * /usr/bin/docker cp todo-manager1:/etc/todos/todo.db /home/krasi/Docker/app/backup)"
crontab crontab_backup
rm crontab_backup
