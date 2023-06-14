#!/bin/bash

# Install Docker
curl -fsSL https://get.docker.com | sudo bash

# Install the latest version of Docker Compose
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
sudo curl -L "https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Add the vagrant user to the docker group
sudo usermod -aG docker vagrant

# Enable and start the Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Print the installed versions of Docker and Docker Compose
docker --version
docker-compose --version