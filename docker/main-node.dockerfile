# Uses the Ubuntu image from Docker Hub
FROM ubuntu:latest

# Update the repositories 
# Install python, pip, ansible, SSH, ping, ip and nano services
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ansible \
    openssh-server \
    iputils-ping \
    iproute2 \
    nano \
    && apt-get clean

# Creates the folder ansible
RUN mkdir -p /etc/ansible 

# Creates the .ssh folder into the container 
RUN mkdir -p /root/.ssh

# Copy the id_rsa for ssh to node containers
COPY secrets/id_rsa /root/.ssh/id_rsa

# Change the permissions for the previous file 
RUN chmod 600 /root/.ssh/id_rsa

RUN chmod 700 /etc/ansible

# Ansible hosts configuration 
COPY ansible/hosts.yaml /etc/ansible/hosts.yaml

# Ansible playbook 
COPY ansible/ping_playbook.yaml /etc/ansible/ping_playbook.yaml

# Start SSH service
RUN service ssh start

# Executes SSH service as main process
CMD ["/usr/sbin/sshd", "-D"]

