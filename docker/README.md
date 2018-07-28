
# Docker
Docker is not a VM (virtual machine). 

Docker carves up a Linux OS into small containers. Each container has the sub-set of OS modules that are required to run programs, handle network calls, etc.

Container is self-contained sealed unit of software and just the right amount of OS required to run that software.

## What is Docker
 - Docker is a **client** program. It is a command that you type at the terminal.
 - Docker is also a **server** program that listens to the commands from client program
 - Docker is also a **program** that builds containers from code and its dependencies
 - Docker is also a **service** that one can use to distribute and share containers.

## Installation
Docker's main job is to manager Linux server and start containers on it.
To use docker on Mac or Windows, we need to install the Docker toolbox. This toolbox runs a Linux Virtual machine.

Docker toolbox will install following:
![Docker Installation](https://raw.githubusercontent.com/yogeshrnaik/DevOps/master/docker/images/docker-installation.jpg)

 - a client program called **Docker**. This will help us manage the Docker containers. 
 - a program called **Virtual box** for managing Virtual Machines.
 - a Linux Virtual machine inside which the docker server program runs.
 - a program called **Docker machine** that manages Linux VM. 
 - Inside this Linux VM, it will have the **docker server program**. All docker commands will be sent to this server docker program inside this VM. 

### Installing Docker on Windows
Google for "docker toolbox" or go to https://docs.docker.com/toolbox/toolbox_install_windows/
 
Follow the instructions mentioned on this page.

## How to use Docker on Windows
Once the Docker toolbox installation is complete, run "Docker Quickstart Terminal" from start menu.

This will cause the Docker Linux VM to start up if it is not already running.
![Linux VM](https://raw.githubusercontent.com/yogeshrnaik/DevOps/master/docker/images/docker-linux-vm.jpg)

Docker Quick start Terminal will also connect to this Linux Virtual machine. 

It prints the IP address of the machine to which the terminal is currently connecting to.
```
...
(default) Waiting for an IP...
...
Started machines may have new IP addresses. You may need to re-run the `docker-machine env` command.
...
docker is configured to use the default machine with IP 192.168.99.100
...
naiky@IN1WXL-301034 MINGW64 /c/DDrive/tools/Docker Toolbox
$
```
![Docker Quick start Terminal](https://raw.githubusercontent.com/yogeshrnaik/DevOps/master/docker/images/docker-quickstart-terminal.jpg)

In this Quick start terminal, we can run any docker command. Docker commands are sent to the Docker server program running inside the Linux VM.

### docker-machine commands
Docker toolbox also installs docker-machine program that we can use to manage the Linux VM.

#### docker-machine ip 
It will print the IP address of the Linux VM to which it is currently connected to.
```
naiky@IN1WXL-301034 MINGW64 /c/DDrive/tools/Docker Toolbox
$ docker-machine ip
192.168.99.100
```
#### docker-machine ssh 
It connects to that machine and will give you command  prompt.
```
$ docker-machine ssh
                        ##         .
                  ## ## ##        ==
               ## ## ## ## ##    ===
           /"""""""""""""""""\___/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
           \______ o           __/
             \    \         __/
              \____\_______/
 _                 _   ____     _            _
| |__   ___   ___ | |_|___ \ __| | ___   ___| | _____ _ __
| '_ \ / _ \ / _ \| __| __) / _` |/ _ \ / __| |/ / _ \ '__|
| |_) | (_) | (_) | |_ / __/ (_| | (_) | (__|   <  __/ |
|_.__/ \___/ \___/ \__|_____\__,_|\___/ \___|_|\_\___|_|
Boot2Docker version 18.05.0-ce, build HEAD : b5d6989 - Thu May 10 16:35:28 UTC 2018
Docker version 18.05.0-ce, build f150324
docker@default:~$
```

#### docker-machine stop
This will stop the VM.
```
naiky@IN1WXL-301034 MINGW64 /c/DDrive/tools/Docker Toolbox
$ docker-machine stop
Stopping "default"...
Machine "default" was stopped.
```
#### docker-machine start
This will start the VM.
```
naiky@IN1WXL-301034 MINGW64 /c/DDrive/tools/Docker Toolbox
$ docker-machine start
Starting "default"...
(default) Check network to re-create if needed...
(default) Windows might ask for the permission to configure a dhcp server. Sometimes, such confirmation window is minimized in the taskbar.
(default) Waiting for an IP...
Machine "default" was started.
Waiting for SSH to be available...
Detecting the provisioner...
Started machines may have new IP addresses. You may need to re-run the `docker-machine env` command.
```
#### docker-machine scp
This command is used to copying files into the VM.

#### docker-machine upgrade
This command will install the latest version of docker into the VM.

	Note: In case of issues with VM, try to upgrade and then restart the VM.

## The Docker flow: Images to containers
An image is a file that makes up just enough of the operating system to be able to run it independently.

From Docker Quickstart Terminal type following to list docker images available on your computer.
```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED            SIZE
ubuntu              14.04               578c3e61a98c        4 weeks ago         223MB
ubuntu              latest              113a43faa138        4 weeks ago         81.2MB
hello-world         latest              e38bc07ac18e        2 months ago        1.85kB
```
| Column name | Description  |
|--|--|
| Repository | Where the image came from |
| Tag | Tag is like a version number |
| Image ID | Internal docker representation of this image  |

We can refer to any image by a combination of it's name and tag. 
Or we can refer to it by its image ID.
E.g. **ubuntu:latest** or **113a43faa138**

### Running image
**docker run** command takes an image and converts it into a running container with a process in it that is doing something.

![Docker Image to Running Container](https://raw.githubusercontent.com/yogeshrnaik/DevOps/master/docker/images/docker-image-to-container.jpg)

For example, the following command will launch a container that is running latest Ubuntu bash.

	-ti option in the command is for terminal interactive  

```
naiky@IN1WXL-301034 MINGW64 /c/DDrive/tools/Docker Toolbox
$ docker run -ti ubuntu:latest bash

root@3b30503170b8:/# ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var

root@3b30503170b8:/# cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04 LTS"

root@3b30503170b8:/# exit
```
You can exit from the Ubuntu bash by typing "exit" command or CTRL+D.

To see which containers docker is running currently, use "**docker ps**" command.
```
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
3b30503170b8        ubuntu:latest       "bash"              2 minutes ago       Up 2 minutes                            friendly_johnson
```
| Column name | Description  |
|--|--|
| Container ID | Each running container has an unique ID. It is different than the image ID from which it was created. |
| Image | Image from which the container was created |
| Command | Command the container is running |
| Names | Docker provided a name to this container as we did not specify any |

### Stopped Containers
If we create any new files and/or install new software, while inside a running container, once the container is stopped, those files/software changes **do not** end up in the image from which the container was created. They remain in the stopped container.

We can find all stopped containers using following command.
```
naiky@IN1WXL-301034 MINGW64 /c/DDrive/tools/Docker Toolbox
$ docker ps -a
CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS                      PORTS               NAMES
91910e2383cf        ubuntu:latest       "bash"               8 minutes ago       Exited (0) 7 minutes ago                        thirsty_carson
4fc959ba597e        ubuntu:latest       "bash"               8 minutes ago       Exited (0) 7 minutes ago                        confident_bell
```
	-a option will show all containers running as well as stopped.

To see the last stopped container, use following command.
```
$ docker ps -l
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                      PORTS               NAMES
91910e2383cf        ubuntu:latest       "bash"              15 minutes ago      Exited (0) 14 minutes ago                       thirsty_carson
```
The "Status" of stopped container can give you a clue why it was stopped.
For example, in above case the status is "Exited (0)" which means container was stopped without any errors.

### Container to Image
All the changes done inside a running container remain in the stopped container. But the original docker image from which the container was created does not change.

We can create a new image from a stopped container.

![Docker Flow](https://raw.githubusercontent.com/yogeshrnaik/DevOps/master/docker/images/docker-flow.jpg)

Create a new image from a stopped container.
 1. Lets launch a container first
 2. Then create a new file inside the container
 3. Stop the container
 4. Use docker commit to create new image from the stopped container

```
naiky@IN1WXL-301034 MINGW64 /c/DDrive/tools/Docker Toolbox
$ docker run -ti ubuntu:latest bash

root@a84c1e236c44:/# ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var

root@a84c1e236c44:/# touch MY-SAMPLE-FILE.txt

root@a84c1e236c44:/# ls
MY-SAMPLE-FILE.txt  bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var

root@a84c1e236c44:/# exit

$ docker ps -l
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                     PORTS               NAMES
a84c1e236c44        ubuntu:latest       "bash"              24 seconds ago      Exited (0) 4 seconds ago                       quizzical_wozniak

$ docker commit a84c1e236c44
sha256:788c2d98f4fc32973935056b682395c9cea2cba79d9f3da1f78dbbd1b94917c5
```
Docker has created a very big number for the new image which is not very convenient.

We can use the "tag" command to give name to image.
```
$ docker tag 788c2d98f4fc32973935056b682395c9cea2cba79d9f3da1f78dbbd1b94917c5 my-sample-image

$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
my-sample-image     latest              788c2d98f4fc        3 minutes ago       81.2MB
hello-world         latest              e38bc07ac18e        3 months ago        1.85kB

$ docker run -ti my-sample-image bash
root@e00d28c69fc9:/# ls
MY-SAMPLE-FILE.txt  bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var

root@e00d28c69fc9:/# exit
```
Creating image from a stopped container and giving the new image a name can be done in a single command as follows.
```
$ docker commit <CONTAINER_ID> <NEW_IMAGE_NAME>
OR
$ docker commit <CONTAINER_NAME> <NEW_IMAGE_NAME>
```

### Deleting Stopped containers and images from local
You can delete an image from local using following command.
```
$ docker rmi <Image_ID OR Image_Tag>
```
If an image is associated with a stopped container then you will get error:
```
$ docker rmi 1bb98ca599a5 7848ab4c11d0 2fd06b8310ca
Error response from daemon: conflict: unable to delete 1bb98ca599a5 (must be forced) - image is being used by stopped container 2c59b05df02c
Error response from daemon: conflict: unable to delete 7848ab4c11d0 (must be forced) - image is being used by stopped container 969a86182e8a
Error response from daemon: conflict: unable to delete 2fd06b8310ca (cannot be forced) - image has dependent child images
```
In this case, we have to delete the stopped container first and then we can delete the image.

To delete container, use following command.
```
$ docker rm <ID_or_Name_of_Container> <ID_or_Name_of_Container>
```
## Running things in Docker
### docker run
When we run command "docker run" it starts a container by giving an image name and a process to run in that container.

	docker run <OPTIONS> <IMAGE_NAME> <MAIN_PROCESS>
 
 - Containers have a main process
 - The container stops when that main process exists . The container is not done until that process exits. 
 - If we start other processes in the container later, the container still exits when that main process finishes.

So docker containers have one main process, and containers have names. If we don't give it a name, docker will make one up.

### --rm option
With --rm option in docker run command, the container is removed automatically once it is stopped.
```
$ docker run --rm -ti ubuntu sleep 5
``` 
The above command starts a container, that will sit there for 5 seconds and then exit. 
The container is removed automatically because of --rm option.

Another example where we start a container, sleep for few seconds and then echo "all done" and then the container exits and is also removed due to --rm option.
```
$ docker run --rm -ti ubuntu bash -c "sleep 3; echo all done"
all done
``` 
### Leaving things running in a container (-d option) 
Docker has the idea of detached containers. We can start a container and just let it run.

This is achieved using -d option.
```
$ docker run -d -it ubuntu bash
6ff08c5f3deede7a14cdc1c697fd88a510e52a79d7dfadeed4982aa5fee4b9ab
```
This prints the identifier using which we can manage this running container.
Instead of this identifier, we can find the name of the container.
```
$ docker ps -l
CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
6ff08c5f3dee        ubuntu              "bash"              About a minute ago   Up About a minute                       goofy_feynman
```
We can attach back to this running container using its name.
```
$ docker attach goofy_feynman
root@6ff08c5f3dee:/#
```
To detach from a running container, press CTRL+P followed by CTRL+Q.
```
root@6ff08c5f3dee:/# read escape sequence

naiky@IN1WXL-301034 MINGW64 /c/DDrive/tools/Docker Toolbox

$ docker ps -l
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
6ff08c5f3dee        ubuntu              "bash"              3 minutes ago       Up 3 minutes                            goofy_feynman
```
Detaching from container leaves the container still running and you can attach back to it if you want.

### docker exec
If you want to add another process to a running container, you can do it using "docker exec".

```
$ docker ps -l
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
6ff08c5f3dee        ubuntu              "bash"              3 minutes ago       Up 3 minutes                            goofy_feynman

naiky@IN1WXL-301034 MINGW64 /c/DDrive/tools/Docker Toolbox
$ docker exec -ti goofy_feynman bash
root@6ff08c5f3dee:/#
```
Above command starts up another bash in existing running container.

If original container process stops for some reason then this another bash will also stop automatically.

