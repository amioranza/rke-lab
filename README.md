# Deploying Kubernetes lab with vagrant/virtualbox/rke

This project is to help anyone to start a Kubernetes cluster with ease to use as a lab and starting point, it's is way better than minikube because you can really use it in production just with little tweaks.

## Pre-reqs

1. Vagrant - https://www.vagrantup.com/
2. VirtualBox - https://www.virtualbox.org/
3. RKE - https://github.com/rancher/rke/releases/tag/v0.1.11
4. kubectl - https://kubernetes.io/docs/tasks/tools/install-kubectl/

## Important files

1. Vagrantfile - this file is the definition of virtual machine sizes and parameters;
2. rancher-cluster.yml - this is the RKE cluster definition, any new machine listed on Vagrantfile need to be added to this file to be used as a new node on Kubernetes;
3. automate.sh - this is the file that makes the magic happen, basically is a shell script taht calls vagrant up, rke up and kubectl apply;
4. app-deploy.yml - this file deploys a nginx web server on the new cluster and set an ingress just to demonstration.
