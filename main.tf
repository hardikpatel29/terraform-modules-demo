terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


provider "aws" {
  region = "ap-south-1"

   default_tags {
    tags = {

      Owner   = "HardikPatel"
      Project = "terraform-module-demo"
    }
  }
}

module "ec2-instance" {
  source        = "./ec2"
  ami_id        = "ami-0f69bc5520884278e"
  instance_type = "t2.micro"
  vpc_id        = "vpc-43b84028"
  port          = "22"
  cidr_block    = "0.0.0.0/0"
}