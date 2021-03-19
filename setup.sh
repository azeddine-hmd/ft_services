#!/bin/bash

ROOT="$(PWD)/srcs"
KUBERNETES_CONFIG=$ROOT/kubernetes

# start minikube
minikube start

# using minikube docker host
eval $(minikube docker-env)

# build images
docker build -t wordpress srcs/wordpress
docker build -t phpmyadmin srcs/phpmyadmin

# running each image in a single pod
[ -d "$KUBERNETES_CONFIG" ] && kubectl apply -f $KUBERNETES_CONFIG

# adding service type of loadbalancer for each of pod
# TODO: later
