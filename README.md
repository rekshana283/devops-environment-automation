# DevOps Environment Automation

## Overview

This project automates DevOps environment validation and Kubernetes deployment using Bash scripting.

The automation script checks the required DevOps tools, validates Docker and Minikube availability, records execution logs, and deploys a sample Kubernetes application.

## Objectives

- Automate DevOps environment validation
- Check required DevOps tools
- Validate Docker availability
- Validate Minikube availability
- Implement error handling
- Maintain execution logs
- Automate Kubernetes application deployment
- Provide a repeatable environment validation process

## Technologies Used

- Bash
- Git
- Docker
- Kubernetes
- Minikube
- kubectl
- NGINX

## Features

- DevOps tool validation
- Docker availability check
- Minikube status check
- Error handling
- Execution logging
- Kubernetes deployment automation
- Deployment and service verification

## Project Structure

devops-environment-automation/
├── setup-environment.sh
├── README.md
├── k8s/
│   └── deployment.yaml
├── logs/
│   └── environment-setup.log
└── screenshots/
    ├── 01-project-file-created.png
    ├── 02-devops-environment-check.png
    ├── 03-automated-environment-validation.png
    ├── 04-final-environment-validation.png
    ├── 05-kubernetes-automation-result.png
    └── 06-final-automation-verification.png

## How to Run

Make the script executable:

chmod +x setup-environment.sh

Run the automation script:

./setup-environment.sh

## Kubernetes Verification

Check the deployment:

kubectl get deployment

Check the pods:

kubectl get pods

Check the service:

kubectl get service

## Logging

Automation logs are stored in:

logs/environment-setup.log

To view the latest log entries:

tail -20 logs/environment-setup.log

## Kubernetes Deployment

The project includes a Kubernetes manifest that deploys an NGINX application with two replicas and a Kubernetes ClusterIP service.

The Bash automation script applies the Kubernetes manifest when Minikube is available.

## Error Handling

The automation script checks the availability of required services before continuing.

If Docker is not running, the script reports an error and stops the validation process.

If Minikube is unavailable, the Kubernetes deployment step is skipped and a warning is displayed.

## Result

The project validates the local DevOps environment, records execution logs, and automates deployment of a sample Kubernetes application.

## Conclusion

This project demonstrates basic DevOps environment automation using Bash scripting, Docker, Kubernetes, and Minikube.

It provides a repeatable approach for validating development tools, checking required services, recording execution logs, and deploying a containerized application.

