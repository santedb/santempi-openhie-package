# SanteDB kubernetes 

To start
- cd to /sante-mpi/main folder
- kubectl apply -f db-deployment.yaml,db-service.yaml,santedb-deployment.yaml,santedb-service.yaml

To check
- kubectl get deployments
- kubectl get pods 
- kubectl describe <podname>

- You an also go to localhost:8080/api-docs and verify you are able to access the swagger docs for santedb

To scale down
- kubectl scale deployments <name of deployment> --replicas=0