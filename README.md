# KubeJavaOps
Deploying a Spring application to a Kubernetes cluster using Terraform. KubeJavaOps is a sample project demonstrating the deployment of a Java application on AWS using Kubernetes and Terraform. This project includes the necessary configurations and scripts to set up AWS infrastructure, deploy the Java application on Kubernetes, and manage the entire workflow with Terraform.

## Table of Contents

- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Setting up AWS Infrastructure with Terraform](#setting-up-aws-infrastructure-with-terraform)
- [Building and Packaging the Java Application](#building-and-packaging-the-java-application)
- [Deploying Java Application to Kubernetes](#deploying-java-application-to-kubernetes)
- [Accessing the Application](#accessing-the-application)
- [Cleaning Up Resources](#cleaning-up-resources)
- [Troubleshooting](#troubleshooting)
- [Conclusion](#conclusion)

## Introduction

KubeJavaOps is a DevOps project showcasing the deployment of a Java application using AWS, Kubernetes, and Terraform. This README provides a step-by-step guide to set up the project, deploy the Java application, and manage infrastructure using Terraform.

## Project Structure

- `java-app/`: Contains the source code for the Java application.
- `aws-infrastructure.tf`: Terraform script for provisioning AWS infrastructure.
- `k8s-deployment.yaml`: Kubernetes YAML file for deploying the Java application.
- `k8s-terraform.tf`: Terraform script for managing Kubernetes resources.

## Prerequisites

Before starting, ensure you have the following prerequisites installed and configured:

- AWS CLI
- Terraform
- Docker
- Kubernetes Cluster

## Setting up AWS Infrastructure with Terraform

Navigate to the project directory:

   cd path/to/KubeJavaOps

Initialize Terraform:
   terraform init

Apply Terraform configurations:
   terraform apply

## Building and Packaging the Java Application

Build the Java application:

cd java-app/
./mvnw clean install
This will build the Java application and create an executable JAR file.

Build the Docker image:
docker build -t my-java-app:latest .

## Deploying Java Application to Kubernetes

Apply Kubernetes configurations:

terraform apply -target=kubernetes_deployment.my_java_app -target=kubernetes_service.my_java_app_service
This will deploy the Java application on Kubernetes.

## Accessing the Application
Get the external IP of the LoadBalancer:

kubectl get service my-java-app-service
Access the application in your web browser using the external IP.

## Cleaning Up Resources
To clean up AWS resources and Kubernetes deployments:

terraform destroy
Follow the prompts to destroy resources.

## Troubleshooting
If you encounter issues, refer to the Troubleshooting section in the documentation.

## Conclusion
Congratulations! You have successfully set up and deployed the Java application using AWS, Kubernetes, and Terraform. Feel free to explore and customize the project according to your needs.


