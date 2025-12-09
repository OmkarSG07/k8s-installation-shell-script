#!/bin/bash

#Update System Packages [On Master & Worker Node]
sudo apt-get update  

#Install Docker[On Master & Worker Node]
sudo apt install docker.io -y
sudo chmod 666 /var/run/docker.sock 

#Install Required Dependencies for Kubernetes[On Master & Worker Node]
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg
sudo mkdir -p -m 755 /etc/apt/keyrings

#Add Kubernetes Repository and GPG Key[On Master & Worker Node]     !!! check for latest stable realease versions  !!!
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

#Update Package List[On Master & Worker Node]
sudo apt update

#Install Kubernetes Components[On Master & Worker Node]    !!! check for latest stable realease versions  !!!
sudo apt install -y kubeadm=1.28.1-1.1 kubelet=1.28.1-1.1 kubectl=1.28.1-1.1

