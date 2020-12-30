#!/bin/sh
#minikube --vm-driver=virtualbox start --extra-config=apiserver.service-node-port-range=1-35000
minikube addons enable metallb
minikube addons enable dashboard
eval $(minikube docker-env)
docker build -t nginx-image ./nginx/
kubectl apply -f ./metallb-configmap.yaml
kubectl apply -f ./nginx/nginx.yaml
