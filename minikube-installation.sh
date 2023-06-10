#!/bin/bash

# Step 1: Install curl
apt install curl

# Step 2: Install Docker
apt install docker

# Step 3: Download kubectl binary
curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl

# Step 4: Download kubectl SHA256 checksum
curl -LO https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256

# Step 5: Verify kubectl SHA256 checksum
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

if [ $? -ne 0 ]; then
    echo "Error: SHA256 checksum verification failed for kubectl."
    exit 1
fi

# Step 6: Install kubectl
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Step 7: Check kubectl version
kubectl version --client

# Step 8: Download minikube binary
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

# Step 9: Install minikube
install minikube-linux-amd64 /usr/local/bin/minikube

# Step 10: Add current user to the docker group
usermod -aG docker $USER && newgrp docker

# Step 11: Start minikube with Docker driver
minikube start --driver=docker

# Step 12: Set minikube driver to Docker
minikube config set driver docker

# Step 13: Check minikube version
minikube version

# Step 14: Check minikube status
minikube status
