# KubeJavaOps
Deploying a Spring application to a Kubernetes cluster using Terraform. KubeJavaOps is a sample project demonstrating the deployment of a Java application on AWS using Kubernetes and Terraform. This project includes the necessary configurations and scripts to set up AWS infrastructure, deploy the Java application on Kubernetes, and manage the entire workflow with Terraform.

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

```bash
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
