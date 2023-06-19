#!/bin/bash

kubectl apply -f nginx-deployment.yaml

kubectl apply -f nginx-service.yaml

kubectl apply -f postgres-deployment.yaml

kubectl apply -f postgres-service.yaml

kubectl apply -f pvc.yaml