# after installing Docker from https://docs.docker.com/get-docker/
# To list available commands, either run `docker` with no parameters or execute
# `docker help`
$ docker

>>> docker [OPTIONS] COMMAND [ARG...]
       docker [ --help | -v | --version ]

    A self-sufficient runtime for containers.

    Options:
        --config string      Location of client config files (default "/root/.docker")
    -c, --context string     Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set with "docker context use")
    -D, --debug              Enable debug mode
        --help               Print usage
    -H, --host value         Daemon socket(s) to connect to (default [])
    -l, --log-level string   Set the logging level ("debug"|"info"|"warn"|"error"|"fatal") (default "info")
        --tls                Use TLS; implied by --tlsverify
        --tlscacert string   Trust certs signed only by this CA (default "/root/.docker/ca.pem")
        --tlscert string     Path to TLS certificate file (default "/root/.docker/cert.pem")
        --tlskey string      Path to TLS key file (default "/root/.docker/key.pem")
        --tlsverify          Use TLS and verify the remote
    -v, --version            Print version information and quit

    Commands:
        attach    Attach to a running container
        # […]

$ docker run hello-world
# `docker run <container-name>` is used to run a container, it will pull the
# images from Docker Hub if they don't already exist in your system. Here the
# docker client connects to the daemon which in turn pulls the "hello-world"
# image from the Docker Hub. The daemon then builds a new container from the
# image which runs the executable that produces the output streamed back to the
# client that we see on our terminals.

$ docker run -d ubuntu sleep 60s
# The -d (or --detach) flag is when we want to run a container in the background
# and return back to the terminal. Here we detach an ubuntu container from the
# terminal, the output should be the id and the command exits. If we check
# running containers, we should still see ours there:
# CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS     NAMES
# 133261b4894a   ubuntu    "sleep 60s"   3 seconds ago   Up 2 seconds             vigorous_gould

$ docker run <container-id> -p 3000:8000
# The -p (or --publish) flag is used to expose port 8000 inside the container to
# port 3000 outside the container. This is because the app inside the container
# runs in isolation, hence the port 8000 where the app runs is private to the
# container.

$ docker run -i
# or
$ docker run -it
# Docker runs our containers in a non-interactive mode i.e. they do not accept
# inputs or work dynamically while running. The -i flag keeps input open to the
# container, and the -t flag creates a pseudo-terminal that the shell can attach
# to (can be combined as -it)

$ docker ps -a
# The `docker ps` command only shows running containers by default. To see all
# containers, use the -a (or --all) flag
# Running the above command should output something similar in the terminal:
# CONTAINER ID   IMAGE         COMMAND    CREATED         STATUS                     PORTS     NAMES
# 82f84bf6912b   hello-world   "/hello"   9 minutes ago   Exited (0) 9 minutes ago             eloquent_sammet


$ docker stop hello-world
# or
$ docker start hello-world
# The stop command simply stops one or more containers, and the start command
# starts the container(s) up again! `docker start -a ubuntu` will attach our
# detached container back to the terminal i.e. runs in the foreground

$ docker create alpine
# `docker create` creates a new container for us with the image specified (here,
# alpine), the container does not auto-start unlike `docker run`. This command
# is used to set up a container configuration and then `docker start` to shoot
# it up when required. Note that the status is "Created":
# CONTAINER ID   IMAGE         COMMAND       CREATED             STATUS           PORTS     NAMES
# 4c71c727c73d   alpine        "/bin/sh"     29 seconds ago      Created                   naughty_ritchie

$ docker rm 82f84
# Removes one or more containers using their container ID.
# P.S.: we can use only the first few characters of the entire ID to identify
# containers

$ docker images
# Displays all images and their information, created here means the latest image
# tag updated on Docker Hub:
# REPOSITORY    TAG       IMAGE ID       CREATED         SIZE
# ubuntu        latest    a8780b506fa4   9 days ago      77.8MB
# alpine        latest    9c6f07244728   3 months ago    5.54MB
# hello-world   latest    feb5d9fea6a5   13 months ago   13.3kB

$ docker rmi
# Removes one or more images from your system which do not have their instances
# (or containers as we know them) running. If the image has an attached
# container, either delete the container first or use the -f (or --force) flag
# to forcefully delete both the container and image.

$ docker pull busybox
# The pull command downloads the specified image on our system from Docker Hub.

$ docker exec -it 7b272 bash
# This command is used to run a command in the running container's default
# directory. Here 7b272 was our ubuntu container and the above command would
# help us interact with the container by opening a bash session.

$ docker logs <container-id>
# Displays the information logged by the specified container
# root@7b27222e4bb7:/# whoami
# root
# root@7b27222e4bb7:/# pwd
# /
# root@7b27222e4bb7:/# ls
# bin  boot  dev  etc  home  lib  lib32  lib64 libx3 srv  sys  tmp  usr  var
# root@7b27222e4bb7:/# exit
# exit

# More commands can be found at https://docs.docker.com/engine/reference/commandline/docker/
FROM <base-image>
# define base image

ENV USERNAME='admin'\
    PWD='****'
# optionally define environmental variables

RUN apt-get update
# run linux commands inside container env, does not affect host env
# This executes during the time of image creation

COPY <src> <target>
# executes on the host, copies files from src (usually on the host) to target
# on the container

ENTRYPOINT ["some-script.sh"]
# executes an entire script as an entrypoint

CMD [<args>,...]
# always part of dockerfile, introduces entry point linux command e.g.
# `CMD node server.js`
# This executes after image creation only when the container from the image
# is running.
$ docker build <path-to-dockerfile>
# used to build an image from the specified Dockerfile
# instead of path we could also specify a URL
# -t tag is optional and used to name and tag your images for e.g.
# `$ docker build -t my-image:0.1 ./home/app`
# rebuild images everytime you make changes in the dockerfile
$ docker login
# to login to Docker Hub using your username and password

$ docker tag <src-image>[:<src-tag>] <target-image>[:<target-tag>]
# this tags a local src-image to a public target-image
# e.g. `docker tag my-sample-app:1.0.0  akshitadixit/my-sample-app`
# if tags are not specified, they're defaulted to `latest`

$ docker push <target-image>[:<target-tag>]
# uploads our image to Docker Hub
# e.g. `docker push akshitadixit/my-sample-app`
# this image will be accessible under your profile's repositories as
# `https://hub.docker.com/r/username/image-name`
