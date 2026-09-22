#!/bin/bash

LOG_DIR="logs"
LOG_FILE="$LOG_DIR/environment-setup.log"

mkdir -p "$LOG_DIR"

exec > >(tee -a "$LOG_FILE") 2>&1

set -e

echo "=========================================="
echo "     DevOps Environment Automation"
echo "=========================================="
echo "Started at: $(date)"
echo ""

echo "Checking system information..."
echo ""

echo "Operating System: $(uname -s)"
echo "Architecture: $(uname -m)"

echo ""
echo "Checking Git..."
git --version

echo ""
echo "Checking Docker..."
docker --version

echo ""
echo "Checking Docker service..."
if docker info > /dev/null 2>&1
then
    echo "Docker is running."
else
    echo "ERROR: Docker is not running."
    exit 1
fi

echo ""
echo "Checking Kubectl..."
kubectl version --client

echo ""
echo "Checking Minikube..."
minikube version --short

echo ""
echo "Checking Minikube status..."
if minikube status > /dev/null 2>&1
then
    echo "Minikube is available."
else
    echo "WARNING: Minikube is not running."
fi

echo ""
echo "=========================================="
echo "Environment validation completed."
echo "Completed at: $(date)"
echo ""
echo "Checking Kubernetes cluster..."

if minikube status > /dev/null 2>&1
then
    echo "Minikube is running."

    echo ""
    echo "Deploying Kubernetes application..."

    kubectl apply -f k8s/deployment.yaml

    echo ""
    echo "Checking deployment status..."

    kubectl get deployment devops-demo
    kubectl get pods -l app=devops-demo
    kubectl get service devops-demo-service

    echo ""
    echo "Kubernetes deployment completed successfully."
else
    echo "WARNING: Minikube is not running."
    echo "Kubernetes deployment skipped."
fi
echo "=========================================="

