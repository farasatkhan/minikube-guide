# MiniKube Installation Guide
After Running `minikube-installation.sh` Run the commands below without root privileges.

###### Note: Make sure you you start the minikube without root privileges.

## Start Minikube

1. To start Minikube with the Docker driver, follow the steps below:
```
minikube start --driver=docker
```
2.  Set minikube driver to Docker
```
minikube config set driver docker
```
3.  Check minikube version
```
minikube version
```
4.  Check minikube status
```
minikube status
```