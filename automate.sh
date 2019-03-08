#!/usr/bin/env bash

# checking pre-reqs
echo "#### Checking RKE ####"
if [ ! -e /usr/local/bin/rke ]; then
  curl -LO https://github.com/rancher/rke/releases/download/v0.1.17/rke_linux-amd64
  chmod +x rke_linux-amd64
  mv rke_linux-amd64 rke
  sudo mv rke /usr/local/bin/rke
else
  echo "Pre-req OK!"
fi

echo "#### Checking kubetctl ####"
if [ ! -e /usr/local/bin/kubectl ]; then
  curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kubectl
  chmod +x ./kubectl
  sudo mv ./kubectl /usr/local/bin/kubectl
else
  echo "Pre-req OK!"
fi

echo "#### Create and setup machines ####"
vagrant up

echo "####  Deploy K8S via RKE  ####"
./deploy-k8s-rke.sh

export KUBECONFIG=kube_config_rancher-cluster.yml
echo "# Checking services status"
K8S_PENDING=`kubectl get pods --all-namespaces --kubeconfig kube_config_rancher-cluster.yml --field-selector=status.phase!=Running,status.phase!=Succeeded  | wc -l`
while [ ${K8S_PENDING} -ne 0 ]; do
    sleep 10
    echo -n "."
    K8S_PENDING=`kubectl get pods --all-namespaces --kubeconfig kube_config_rancher-cluster.yml --field-selector=status.phase!=Running,status.phase!=Succeeded | wc -l`
done
echo "# Kubernetes services OK."

#kubectl apply -f app_deploy/*.yml
