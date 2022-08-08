
# kubernetes

![img](https://buddy.works/guides/covers/optimize-kubernetes-workflow/kubernetes-cover.png)

|                                                                                                                 Build & Push To ACR                                                                                                                 	|                                                                                                                        Deploy STAGING                                                                                                                        	|                                                                                                                        Deploy PRODUCTION                                                                                                                        	|
|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:	|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:	|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:	|
| [![Build Status](https://dev.azure.com/Benswisa1/k8s-WeightApp/_apis/build/status/k8s-WeightApp?branchName=main&stageName=Build%20stage&jobName=Build)](https://dev.azure.com/Benswisa1/k8s-WeightApp/_build/latest?definitionId=7&branchName=main) 	| [![Build Status](https://dev.azure.com/Benswisa1/k8s-WeightApp/_apis/build/status/k8s-WeightApp?branchName=main&stageName=Deploy%20To%20Staging&jobName=Deploy)](https://dev.azure.com/Benswisa1/k8s-WeightApp/_build/latest?definitionId=7&branchName=main) 	| [![Build Status](https://dev.azure.com/Benswisa1/k8s-WeightApp/_apis/build/status/k8s-WeightApp?branchName=main&stageName=Deploy%20To%20Production&jobName=Deploy)](https://dev.azure.com/Benswisa1/k8s-WeightApp/_build/latest?definitionId=7&branchName=main) 	|




 this project we deploy the [weight-tracker-app](https://github.com/BemjaminS/bootcamp-app-U) with kubernetes.
- Using infrastracture as code to Deploy the Environment's (Terraform):
- using azure kubernetes service (AKS)
- 2X cluster's for STAGING/PRODUCTION environment
- Azure container registry (ACR)
- Azure-devops for CI/CD pipeline:
  * Using Pipeline library to store the secret
  * Create image pull secret to kubernetes cluster:
    ```
    --from-literal=COOKIE_ENCRYPT_PWD=$(COOKIE_ENCRYPT_PWD)
    --from-literal=HOST=$(HOST)
    --from-literal=PORT=$(PORT)
    --from-literal=NODE_ENV=$(NODE_ENV)
    --from-literal=HOST_URL=$(HOST_URL)
    --from-literal=OKTA_CLIENT_ID=$(OKTA_CLIENT_ID)
    --from-literal=OKTA_CLIENT_SECRET=$(OKTA_CLIENT_SECRET)
    --from-literal=OKTA_ORG_URL=$(OKTA_ORG_URL)
    --from-literal=PGHOST=$(PGHOST)
    --from-literal=PGUSERNAME=$(PGUSERNAME)
    --from-literal=PGDATABASE=$(PGDATABASE)
    --from-literal=PGPASSWORD=$(PGPASSWORD)
    --from-literal=PGPORT=$(PGPORT)
     ```
  * deploy manifests:
    ```
    $(Pipeline.Workspace)/manifests/deployment.yml
    $(Pipeline.Workspace)/manifests/service.yml
    $(Pipeline.Workspace)/manifests/ingress.yml
    ```
- using [helm](https://artifacthub.io/packages/helm/bitnami/postgresql) to create PostgresSql DB
  **```helm repo add bitnami https://charts.bitnami.com/bitnami```**
  **```helm install <my-release> bitnami/postgresql```**



##  Dockerfile: 
- using Node:14-alpine
- Create an app folder that contains the app files
- App installation and dependencies
- Expose the app to port 80 
- ENTRYPOINT npm run initdb && npm run dev



## NodeWeightTracker application on AKS meeting the following requirements:
- The NodeWeightTracker application is accessible from the internet
- The NodeWeightTracker application is exposed to the internet on port 80
- The NodeWeightTracker must have at least 3 instances to ensure high availability
- Use configmaps/secrets to store your application configurations
- application expose using Ingress-controller

## CI/CD:
[![Screen-Shot-2022-08-08-at-13-47-21.png](https://i.postimg.cc/3JdnFXwJ/Screen-Shot-2022-08-08-at-13-47-21.png)](https://postimg.cc/xcVv0bHW)

## Project structure:
![image](https://bootcamp.rhinops.io/images/kubernetes-resources.png)

## pipeline structure:
![sela-Bootcamp](https://bootcamp.rhinops.io/images/k8s-cicd.png)

## RESULT:
![app running](https://camo.githubusercontent.com/e6958692307c27d2b2ede570a12d5034449ae56f788a5dcbeab48ab367f98e4c/68747470733a2f2f692e706f7374696d672e63632f514330546e304c442f74656e6f722e676966)




