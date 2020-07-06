#!/bin/bash

set -e

available_namespaces() {
  echo "Available Namespaces: "
  kubectl get namespaces -o json | jq '.items | map(.metadata.name)'
  echo "--------------------------------------"
}

if [ $# -eq 0 ] ; then
  namespace=$(kubectl config view --minify -o json | jq -r '.contexts[0].context.namespace' | xargs -I _ echo -n _)
  available_namespaces
else
  namespace=${1}
  namespace_exists=$(kubectl get namespaces -o json | jq ".items | any(.metadata.name == \"${namespace}\")")
  
  if test "${namespace_exists}" != true ; then
    echo "Namespace [${namespace}] doesn't exist!"
    available_namespaces
    exit 1
  fi
  
  kubectl config set-context --current --namespace="${namespace}"
fi

current_cluster=`kubectl config current-context | xargs -I _ echo -n _`
echo "Kube Cluster: ${current_cluster}"
echo "  >> Using namespace: ${namespace}"
echo "  >> Context Details:"
kubectl config get-contexts "${current_cluster}"
