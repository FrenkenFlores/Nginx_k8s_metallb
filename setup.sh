#!/bin/sh
minikube --vm-driver=virtualbox start --extra-config=apiserver.service-node-port-range=1-35000
minikube addons enable metallb
minikube addons enable dashboard
minikube addons enable metrics-server
eval $(minikube docker-env)
kubectl apply -f ./metallb-configmap.yaml
docker build -t nginx-image ./nginx/
kubectl apply -f ./nginx/nginx.yaml
