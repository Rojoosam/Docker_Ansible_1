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

# Creates the hosts file for ansible
RUN mkdir -p /etc/ansible && \
    echo "localhost ansible_connection=local" > /etc/ansible/hosts

# Creates the .ssh folder into the container 
RUN mkdir -p /root/.ssh

# Copy the id_rsa for ssh to node containers
COPY /secrets/id_rsa /root/.ssh/id_rsa

# Change the permissions for the previous file 
RUN chmod 600 /root/.ssh/id_rsa

# Start SSH service
RUN service ssh start

# Executes SSH service as main process
CMD ["/usr/sbin/sshd", "-D"]

