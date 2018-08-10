
# Ansible
Ansible is a task execution engine. 
Tasks are defined in YAML file in human readable way.
The hosts on which we want to execute these tasks is defined in a file called "inventory". 

**Example of Inventory file:**
```
[all]
web1
web2
db1
db2
[web]
web1
web2
[database]
db1
db2
```
The inventory file lists the host names under different groups.
Group is defined using [GROUP_NAME].

Ansible can be executed on any machine and it connects to target hosts (via SSH). 
The machine on which Ansible is running is called "Ansible host"

The host on which we want to execute different tasks is called "target host" in Ansible terms.

Ansible is designed to be Idempotent. It means Ansible will execute the tasks only first time and it would do nothing if we repeat  the tasks again.

For example, if one of the Anislbe task is to create a file then Ansible will create the file when the task is executed first time. But for subsequent execution, Ansible will identify that the file is already present and would not create a new file again.

## Install Ansible on Windows
Ansible host cannot be a Windows machine.
To run Ansible on Windows, you need to install "Windows Subsystem for Linux (Beta)".

Follow the steps mentioned on page to install WSL  (Bash on Ubuntu on Windows).
http://wsl-guide.org/en/latest/installation.html
