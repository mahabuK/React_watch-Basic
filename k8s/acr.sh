#!/bin/bash

AKS_RESOURCE_GROUP=
AKS_CLUSTER_NAME=
ACR_RESOURCE_GROUP=
ACR_NAME=

# Get the id of the service principal configured for AKS
CLIENT_ID=$(az aks show --resource-group AzurekamyKubernetProject --name KamyClusterMonday --query "servicePrincipalProfile.clientId" --output tsv)

# Get the ACR registry resource id
ACR_ID=$(az acr show --name kamymandagacr02 --resource-group AzurekamyKubernetProject --query "id" --output tsv)

# Create role assignment
az role assignment create --assignee 0059b125-455b-475b-a19c-bbef96325d52 --role acrpull --scope /subscriptions/2472e10a-2055-41f0-8b6a-991f14748492/resourceGroups/AzurekamyKubernetProject/providers/Microsoft.ContainerRegistry/registries/kamymandagacr02
