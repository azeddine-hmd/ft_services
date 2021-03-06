#!/bin/bash

ROOT="$(PWD)/srcs"
WORDPRESS_CONFIG=$ROOT/kubernetes/wordpress.yaml
PHPMYADMIN_CONFIG=$ROOT/kubernetes/phpmyadmin.yaml

# before starting minikube check if already exist
minikube delete

# start minikube
minikube start

# using minikube docker host
eval $(minikube docker-env)

# build images
docker build -t wordpress srcs/wordpress
docker build -t phpmyadmin srcs/phpmyadmin

# running each image in a single pod
[ -f "$WORDPRESS_CONFIG" ] && kubectl create -f $WORDPRESS_CONFIG
[ -f "$PHPMYADMIN_CONFIG" ] && kubectl create -f $PHPMYADMIN_CONFIG

# adding service type of loadbalancer for each of pod
# TODO: later
