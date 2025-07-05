terraform {
  required_version = ">=1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


# This file configures the AWS provider for Terraform.
provider "aws" {
  region = "us-west-2"
}