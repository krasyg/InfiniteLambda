#!/usr/bin/env bash

for i in $(seq 1 3) 
do
    echo $(docker stop togo-manager$i)
    echo $(docker rm todo-manager$i)
done

docker volume rm todo-vol
docker volume create --name todo-vol

for i in $(seq 1 3) 
do 
    echo $(docker create -p 300$i:3000 --name todo-manager$i \
    --mount source=todo-vol,target=/etc/todos todo-manager-img)
done

docker cp /home/krasi/Docker/app/backup/todo.db todo-manager1:/etc/todos
