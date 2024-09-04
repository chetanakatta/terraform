terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  backend "s3" {
    bucket = "chetanakatta"  #give s3 bucket name
    key = "remote-state-demo" #any name -->should be different for diff provider
    region = "us-east-1"
    dynamodb_table = "daws-78s-locking"  #dynamodb name
  }
}

#provide authentication here
provider "aws" {
  region = "us-east-1"
}