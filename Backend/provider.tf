terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "terraf-backend01"
    key    = "ec2-01/state.tfstate"
    region = "us-west-2"
  }
  required_version = ">= 1.0"
}

provider "aws" {
  region = "us-west-2"
}

