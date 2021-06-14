#!/bin/bash

KUBE=srcs/kubernetes
CONT=srcs/containers

minikube delete

# start minikube
if ! minikube status | grep -q 'host: Running' > /dev/null 1>&2; then
	minikube start --driver=virtualbox
	minikube addons enable dashboard
	minikube addons enable metallb
fi

eval $(minikube docker-env)

# delete all resources
kubectl delete all --all

# docker images
docker build -t influxdb $CONT/influxdb
docker build -t mysql $CONT/mysql
docker build -t nginx $CONT/nginx
docker build -t grafana $CONT/grafana
docker build -t wordpress $CONT/wordpress
docker build -t phpmyadmin $CONT/phpmyadmin
docker build -t ftps $CONT/ftps

# applying kubernetes resources
kubectl apply -f $KUBE/influxdb.yaml
kubectl apply -f $KUBE/mysql.yaml
kubectl apply -f $KUBE/nginx.yaml
kubectl apply -f $KUBE/grafana.yaml
kubectl apply -f $KUBE/wordpress.yaml
kubectl apply -f $KUBE/phpmyadmin.yaml
kubectl apply -f $KUBE/ftps.yaml
