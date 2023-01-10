#!/bin/bash
echo "***start pre eval script***"
docker stop $(docker ps -qa); 
docker rm $(docker ps -qa);
docker rmi -f $(docker images -qa); 
docker volume rm $(docker volume ls -q);
docker network rm $(docker network ls -q) 2>/dev/null;
sudo rm -rf /home/${USER}/data/
echo "***finish***"