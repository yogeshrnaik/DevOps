
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



### How to use Docker on Windows
Run "Docker Quickstart Terminal" from start menu.

This will cause the Docker machine to start up if it is not already running.
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
In this Quick start terminal, we can run any docker command. This command is sent to the Docker server program running inside the Linux VM.

### docker-machine command
Docker machine command can be used to manage the Linux VM.

**docker-machine ip** will print the IP address of the Linux VM to which it is currently connected to.
```
naiky@IN1WXL-301034 MINGW64 /c/DDrive/tools/Docker Toolbox
$ docker-machine ip
192.168.99.100
```
**docker-machine ssh** will connect to that machine and will give you command  prompt.
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

**docker-machine stop** will stop the VM.
```
naiky@IN1WXL-301034 MINGW64 /c/DDrive/tools/Docker Toolbox
$ docker-machine stop
Stopping "default"...
Machine "default" was stopped.
```
**docker-machine start** will start the VM.
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


## The Docker flow: Images to containers

An image is a file that makes up just enough of the operating system to be able to run it independently.

From Docker Quickstart Terminal type following to list docker images available on your computer:

```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED            SIZE
ubuntu              14.04               578c3e61a98c        4 weeks ago         223MB
ubuntu              latest              113a43faa138        4 weeks ago         81.2MB
hello-world         latest              e38bc07ac18e        2 months ago        1.85kB
```
