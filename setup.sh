#!/bin/bash

# start minikube
minikube start

# using minikube docker host
eval $(minikube docker-env)

# build images
docker build -t wordpress srcs/wordpress
docker build -t phpmyadmin srcs/phpmyadmin

# running each images to a single pod
kubectl run wordpress-pod --image=wordpress --image-pull-policy=Never --port=5050
kubectl run phpmyadmin-pod --image=phpmyadmin --image-pull-policy=Never --port=5000
