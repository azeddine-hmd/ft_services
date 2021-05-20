#!/bin/bash

KUBE=srcs/kubernetes
CONT=srcs/containers

# start minikube
if ! minikube status | grep -q 'host: Running'; then
	minikube start
fi

# enabling addons
minikube addons enable dashboard
minikube addons enable metallb

# launching dashboard
echo "Launching dashboard..."
minikube dashboard 2>/dev/null >/dev/null &

eval $(minikube docker-env)

# Minikube IP
IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)
printf "Minikube IP: ${IP}"

# Building images
echo "Building images..."
docker build -t wordpress $CONT/wordpress --build-arg IP=$IP
docker build -t phpmyadmin $CONT/phpmyadmin --build-arg IP=$IP

# launch pods
kubectl apply -f $KUBE/pods
