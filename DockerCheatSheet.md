# Docker useful commands

## Docker CLI

- Build image from current directory (.) <br>
`docker build --file=Dockerfile --tag=spring-boot-docker-demo:latest --rm=true .`

- Start docker image <br>
`docker run -it --name app -p 8080:8080 -d spring-boot-docker-demo:latest /bin/sh`

- Connect to container OS - use exit to detach <br>
`docker exec -ti app sh`

- Stop container <br>
`docker stop CONTAINER `

- Stop all running containers <br>
`docker stop $(docker ps -aq)`

- Remove container <br>
`docker rm CONTAINER`

- List all containers(even stopped) <br>
`docker container ls --all`
`docker ps -aq`

- Inspect container logs <br>
`docker logs CONTAINER`

- Tail container logs <br>
`docker logs CONTAINER -f`

- List all volumes <br>
`docker volume ls`

- Check volume <br>
`docker volume inspect VOLUME`

- Inspect container <br>
`docker inspect CONTAINER`

- Check container stats <br>
`docker stats`

## Docker Compose

- Start docker <br>
`docker-compose up -d`

- Docker compose remove all containers <br>
`docker-compose rm -f -s -v`