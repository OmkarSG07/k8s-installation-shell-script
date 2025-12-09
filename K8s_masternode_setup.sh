#!/bin/bash

#Initialize Kubernetes Master Node [On MasterNode]   !!! check for latest stable versions !!!
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

#Configure Kubernetes Cluster [On MasterNode]
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#Deploy Networking Solution (Calico) [On MasterNode]
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

#Deploy Ingress Controller (NGINX) [On MasterNode]     !!! check for latest stable versions !!!
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.49.0/deploy/static/provider/baremetal/deploy.yaml
