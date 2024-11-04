# variables.tf
variable "region" {
  description = "The AWS region"
  default     = "us-east-2"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  default     = "funkycadet-eks-cluster"
}

