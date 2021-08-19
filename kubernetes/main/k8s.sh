#!/bin/bash

k8sMainRootFilePath=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

if [ "$1" == "init" ]; then
    kubectl apply -f $k8sMainRootFilePath/santedb/db-deployment.yaml,$k8sMainRootFilePath/santedb/db-service.yaml,$k8sMainRootFilePath/santedb/santedb-deployment.yaml,$k8sMainRootFilePath/santedb/santedb-service.yaml,$k8sMainRootFilePath/santedb/santedb-mpi-app-persistentvolumeclaim.yaml,$k8sMainRootFilePath/santedb/santedb-mpi-config-persistentvolumeclaim.yaml,$k8sMainRootFilePath/santedb/santedb-mpi-seed-persistentvolumeclaim.yaml
    bash "$k8sMainRootFilePath"/../importer/k8s.sh up
elif [ "$1" == "up" ]; then
    kubectl apply -f $k8sMainRootFilePath/santedb/db-deployment.yaml,$k8sMainRootFilePath/santedb/db-service.yaml,$k8sMainRootFilePath/santedb/santedb-deployment.yaml,$k8sMainRootFilePath/santedb/santedb-service.yaml,$k8sMainRootFilePath/santedb/santedb-mpi-app-persistentvolumeclaim.yaml,$k8sMainRootFilePath/santedb/santedb-mpi-config-persistentvolumeclaim.yaml,$k8sMainRootFilePath/santedb/santedb-mpi-seed-persistentvolumeclaim.yaml
    kubectl apply -k $k8sMainRootFilePath
elif [ "$1" == "down" ]; then
    kubectl delete deployment santedb
    kubectl delete deployment sdb-postgres
elif [ "$1" == "destroy" ]; then
    kubectl delete -k $k8sMainRootFilePath
    # bash "$k8sMainRootFilePath"/../importer/k8s.sh clean
    kubectl delete service santedb-service
    kubectl delete service sdb-postgres
    kubectl delete pvc -l santedb-mpi-app
    kubectl delete pvc -l santedb-mpi-config
    kubectl delete pvc -l santedb-mpi-seed 
else
    echo "Valid options are: up, down, or destroy"
fi