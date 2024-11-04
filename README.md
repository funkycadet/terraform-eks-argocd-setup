# EKS Project with Terraform and ArgoCD

This repository contains the configurations for setting up an Amazon Elastic Kubernetes Service (EKS) cluster using Terraform and managing applications with ArgoCD.

## Overview

This project automates the deployment and management of applications on an EKS cluster. It uses Terraform for provisioning the necessary AWS resources and ArgoCD for continuous deployment of Kubernetes applications.

## Prerequisites

Make sure you have the following tools installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [ArgoCD CLI](https://argo-cd.readthedocs.io/en/stable/cli_installation/)

## Setup Instructions

1. **Configure AWS CLI**  
   Set up your AWS credentials by running:
   ```bash
   aws configure
   ```

2. **Initialize Terraform**  
   Navigate to your Terraform configuration directory and initialize Terraform:
   ```bash
   cd terraform
   terraform init
   ```

3. **Deploy the EKS Cluster**  
   Run the following command to create the EKS cluster:
   ```bash
   terraform apply
   ```
   Type `yes` to confirm the deployment.

4. **Configure kubectl**  
   Update your kubeconfig to interact with the EKS cluster:
   ```bash
   aws eks --region <your-region> update-kubeconfig --name <your-cluster-name>
   ```

5. **Install ArgoCD**  
   Deploy ArgoCD in your EKS cluster:
   ```bash
   kubectl create namespace argocd
   kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
   ```

6. **Access the ArgoCD UI**  
   Port-forward the ArgoCD server to access the UI:
   ```bash
   kubectl port-forward svc/argocd-server -n argocd 8080:443
   ```
   Visit `http://localhost:8080` in your browser. The default username is `admin`, and the password can be retrieved with:
   ```bash
   kubectl get pods -n argocd
   kubectl logs <argocd-server-pod-name> -n argocd | grep "admin"
   ```

## Using ArgoCD

1. **Create an Application**  
   Apply your ArgoCD application manifests to deploy your applications.

2. **Sync Applications**  
   Use the ArgoCD UI or CLI to sync your applications to deploy the Kubernetes resources defined in your manifests.

## Resources

- [EKS Documentation](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)
- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [ArgoCD Documentation](https://argo-cd.readthedocs.io/en/stable/)

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

