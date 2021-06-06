#!/bin/bash

KUBE=srcs/kubernetes
CONT=srcs/containers

# start minikube
if ! minikube status | grep -q 'host: Running' > /dev/null 1>&2; then
	minikube start --driver=virtualbox
fi

eval $(minikube docker-env)

# enabling minikube addons
minikube addons enable dashboard
minikube addons enable metallb

# images
docker build -t wordpress $CONT/wordpress
docker build -t phpmyadmin $CONT/phpmyadmin
docker build -t mysql $CONT/mysql
docker build -t nginx $CONT/nginx

# delete all resources
kubectl delete all --all

# applying kubernetes resources
kubectl apply -f $KUBE
