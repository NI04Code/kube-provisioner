terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.7"
    }
  }

  backend "s3" {
    region  = "ap-southeast-1"
    encrypt = true
  }
}