# Uses the Ubuntu image from Docker Hub
FROM ubuntu:latest

# Update the repositories 
# Install SSH service
RUN apt-get update && apt-get install -y \
    openssh-server \
    && apt-get clean

# Creates the .ssh folder into the container 
RUN mkdir -p /root/.ssh

# Copy the public SSH key into the container
COPY /secrets/id_rsa.pub /root/.ssh/authorized_keys

# Change the permissions for the previous file 
RUN chmod 600 /root/.ssh/authorized_keys

# Start SSH service
RUN service ssh start

# Executes SSH service as main process
CMD ["/usr/sbin/sshd", "-D"]

