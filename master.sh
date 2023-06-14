#!/bin/bash

# Initialize the Docker Swarm
sudo docker swarm init --advertise-addr=10.10.10.100

# Generate the join command for worker nodes
JOIN_CMD=$(sudo docker swarm join-token worker -q)

# Save the join command to a file
echo "sudo docker swarm join --token $JOIN_CMD 10.10.10.100:2377" > /vagrant/worker.sh

# Set the permissions of the file
sudo chmod +x /vagrant/worker.sh