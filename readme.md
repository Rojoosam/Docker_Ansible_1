This is an example of an Ansible exercise

> [!IMPORTANT]
> ### ***Requirements***: 
> -   Docker installation 
> -   Docker-compose installation

> [!CAUTION]
> #### You must not change any file name unless you change the docker-files that references those 

> [!NOTE]
> ### Steps to use: 
> -   Use the command: ***ssh-keygen -t rsa -b 4096 -C "user@example.com" -f ./secrets/id_rsa***
> -   You need to configure your hosts and playbook files as you need in the 'ansible' folder
> -   Run (This can take some minutes): ***docker-compose up -d --build*** 
> -   Stablish SSH with the main node: ***docker exec -u 0 -it ubuntu-main-node /bin/bash***
> -   Run this command to run the ansible exercise: ***ansible-playbook etc/ansible/ping_playbook.yaml -i etc/ansible/hosts.yaml***
> -   When you finish, you can remove all with: ***docker compose down***