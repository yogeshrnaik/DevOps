# Starting Jenkins
A quick way to get a Jenkins environment up and running is to do so in a Docker
based environment. The quickest way to get a consistent Docker environment
to match this class is to launch an Ubuntu 18.04 virtual machine on your 
favorite Virtual Machine Manager (e.g. VirtualBox or similar). The machine
can be fairly compact, 1 core, 1GB memory, 10GB disk appears adequate. Once
the base OS is installed, install docker (copy/paste to your VM):

  sudo su -
  bash <( curl -sL https://get.docker.com)

We also want to set up a Jenkins user, which creates a home directory
that we'll use in this course.  We'll also set a password to ensure
that any user who connects to the VM can become the Jenkins user
as presented in the various sections (copy/paste to your VMM):

  useradd jenkins -m -G sudo,docker
  passwd jenkins <<EOF
  jenkins
  jenkins
  EOF


Launching Jenkins can then be accomplished with a simple docker command
as the root user (copy/paste to your VM):

  sudo su -
  docker run --name jenkins --rm -u root -d -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v /home/jenkins:/var/jenkins_home jenkins/jenkins:lts

Once the Jenkins instance is launched - and still logged in as the root user - check
for the administrative password, which would be accessible via (copy/paste
to your VM):

  cat /home/jenkins/secrets/initialAdminPassword

You can find your instance default IP Address (copy/ paste to your VM):

  hostip=hostname -I | awk '/ / {print $1}'
  echo "https://${hostip}:8080"

Note: Because the docker run command includes the '-u root' directive,
all of the directories created by the container will be owned by root
and any interactions will need to be done as the root user unless otherwise
directed in the section.

It is still recommended to launch Jenkins as the root
user for this class. In a production deployment, this would be a security risk. 
For production, the best practice is to launch Jenkins as a
non-root user, but this may impact your ability to use the same host
instance for the Docker container Jenkins agent use cases.
