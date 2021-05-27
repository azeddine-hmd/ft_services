#!/bin/bash

KUBE=srcs/kubernetes
CONT=srcs/containers

# start minikube
if ! minikube status | grep -q 'host: Running' > /dev/null 1>&2; then
	minikube start
fi

# eval
echo "eval docker env..."
eval $(minikube docker-env)

# enabling minikube addons
minikube addons enable dashboard
minikube addons enable metallb
minikube addons enable metrics-server

# images
docker build -t wordpress $CONT/wordpress
docker build -t phpmyadmin $CONT/phpmyadmin
docker build -t mysql $CONT/mysql

# delete all resources
kubectl delete all --all

# applying kubernetes resources
kubectl apply -f $KUBE
