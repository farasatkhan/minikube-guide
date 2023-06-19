# RoadRunner MiniKube Installation Guide
After Running `minikube-installation.sh` Run the commands below without root privileges.

###### Note: Make sure you you start the minikube without root privileges.

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
```
  - name: DB_HOST
    value: <mysql_service_ip>
```

4. Apply Changes
```
kubectl apply -f apache-deployment.yaml
```
