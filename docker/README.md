
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
