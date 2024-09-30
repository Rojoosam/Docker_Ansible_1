This is an example of an Ansible exercise

Requirements: 
-   Docker installation 
-   Docker-compose installation

Steps to use: 
-   Navigate inside the folder "secrets"
-   Use the command: ssh-keygen -t rsa -b 4096 -C "user@example.com" -f ./id_rsa
-   The private file must be called "id_rsa"
-   The public file must be called "id_rsa.pub"
-   Run (This can take some minutes): docker-compose up -d --build 
-   Stablish SSH with the main node: docker exec -u 0 -it ubuntu-main-node /bin/bash
-   When you finish, you can remove all with: docker compose down
