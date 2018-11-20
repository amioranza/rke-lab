#!/usr/bin/env bash
echo "#### Create and setup machines ####"
vagrant up

echo "####  Deploy K8S via RKE  ####"
$PWD/deploy-k8s-rke.sh

export KUBECONFIG=kube_config_rancher-cluster.yml
echo "# Checking services status"
K8S_PENDING=`kubectl get pods --all-namespaces --kubeconfig kube_config_rancher-cluster.yml --field-selector=status.phase!=Running,status.phase!=Succeeded  | wc -l`
while [ ${K8S_PENDING} -ne 0 ]; do
    sleep 10
    echo -n "."
    K8S_PENDING=`kubectl get pods --all-namespaces --kubeconfig kube_config_rancher-cluster.yml --field-selector=status.phase!=Running,status.phase!=Succeeded | wc -l`
done
echo "# Kubernetes services OK."

kubectl apply -f app_deploy/*.yml