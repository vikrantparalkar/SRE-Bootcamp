#!/bin/bash

sudo apt update

sudo apt install -y docker.io docker-compose-v2 make

sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker vagrant