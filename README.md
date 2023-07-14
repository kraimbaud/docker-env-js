Your new Personal Docker Env for JS
===================================

### Create .env.local file 

    cp .env .env.local

### SSH Config
Add the ssh config to your container and rebuild the project

     cp ~/.ssh/* $(pwd)/docker/_config/ssh
     docker-compose up --build -d

To know how to generate a ssh key,
follow this [GitHub tutorial](https://help.github.com/articles/generating-ssh-keys/).

### Install and Run the environment

[Install Docker](http://docs.docker.com/engine/installation/) first to use this environment.
After that you'll be able to build your project.

    docker compose up -d

### Exec Node Container

    docker exec -ti node-local zsh
