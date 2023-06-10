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

## Import Database

1. Get all the pods
```
kubectl get pods
```
2. Run the `import_db.sh` script by providing mysql pod.
```
./import_db.sh <mysql_server_pod>
```

## Configure DB_Host

1. Get all the services and note `mysql_service` ip address.
```
kubectl get service
```
2. Open `apache-deployment.yaml` in an editor.
```
vim apache-deployment.yaml
```
3. Change DB_HOST value with the ip of the `mysql_service`.

