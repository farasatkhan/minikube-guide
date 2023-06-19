# Ngnix Minikube Guide
After Running `minikube-installation.sh` Run the commands below without root privileges.

###### Note: Make sure you you start the minikube without root privileges.

## Start Minikube

1. To start Minikube with the Docker driver, follow the steps below:
```
minikube start --nodes=4 --driver=docker
```
The above command will start 4 worker nodes.

## Create and mount folder
1. Create a folder inside minikube that you want to mount:
```
minikube ssh

mkdir code
```

2. [Optional] Note the Path and open `ngnix-deployment.yaml` and Paste it at below hostPath inside volumes.

```
cd code

pwd
```

Note: This is already set inside `ngnix-deployment.yaml` but if the folder is named differently then we have to change it accordingly.


3. Create an `index.html` file:
```

touch index.html

vi index.html
```

4. Paste The Following Hello World Code:
```
<html>
 <head>
 </head>
 <body>
   <h1>Hello World<h1>
 </body>
</html>
```

5. Save and Exit


## Apply yaml files

1. Run the bash script:
```
./minikube-apply.sh
```

Or do it manually:

```
kubectl apply -f nginx-deployment.yaml

kubectl apply -f nginx-service.yaml

kubectl apply -f postgres-deployment.yaml

kubectl apply -f postgres-service.yaml

kubectl apply -f pvc.yaml
```

2. Get All Services:
```
kubectl get service
```

3. Retrieve the URL of a specific service running within the Minikube cluster. In our case it will be `ngnix-service`
```
minikube service --url ngnix-service
```