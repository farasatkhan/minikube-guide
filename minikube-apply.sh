#!/bin/bash

kubectl apply -f apache-deployment.yaml

kubectl apply -f apache-service.yaml

kubectl apply -f mysql-deployment.yaml

kubectl apply -f mysql-service.yaml

kubectl apply -f pvc.yaml