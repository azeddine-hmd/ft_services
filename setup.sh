#!/bin/bash

KUBE=srcs/kubernetes
CONT=srcs/containers

# start minikube
if ! minikube status | grep -q 'host: Running'; then
	minikube start
fi

# enabling minikube addons
minikube addons enable dashboard > /dev/null 1>&2
minikube addons enable metallb > /dev/null 1>&2

# launching dashboard
echo "Launching dashboard..."
minikube dashboard > /dev/null 1>&2 &

# eval
echo "eval docker env..."
eval $(minikube docker-env)

# minikube IP
IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)
printf "Minikube IP: ${IP}\n"

# Building images
echo "Building images..."
docker build -t wordpress $CONT/wordpress --build-arg IP=$IP
docker build -t phpmyadmin $CONT/phpmyadmin --build-arg IP=$IP
echo "$IP"

# apply configmap
kubectl apply -f $KUBE/configmap

# launch pods
kubectl apply -f $KUBE/pods

# Last opening network in browser
#open http://$IP
