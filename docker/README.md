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
[Docker Installation](https://raw.githubusercontent.com/yogeshrnaik/DevOps/master/docker/images/docker-installation.jpg)

 - a program called **Docker**. This will help us manage the Docker virtual machine. 
 - a program called **Virtual box** for managing Virtual Machines.
 - a program called **Docker machine** that manages Linux VM. Inside this VM, it will have the server side docker program. All docker commands will be sent to this server docker program inside this VM. 


### Installing Docker on Windows


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
