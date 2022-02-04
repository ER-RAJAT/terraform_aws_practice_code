terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }
}

provider "aws" {
    region = "us-east-1"
    access_key = "AKIATF2EW5PS5CRGRQ4S"
    secret_key = "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"
}

module "vpc"{
    source = "terraform-aws-modules/vpc/aws"
    //version = ""
    name = "my-vpc" //var.vpc_name
    cidr = "10.0.0.0/16" //var.vpc_cidr
    azs = var.vpc_azs
    private_subnets = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
    public_subnets = ["10.0.101.0/24","10.0.102.0/24"]
    //enable_nat_gateway = true
    tags = {
        Environment = "dev"
        Author = "rajat.gupta03@nagarro.com"

    }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "anything"

  ami                    = "ami-0a8b4cd432b1c3063" //"ami-0b6705f88b1f688c1"
  instance_type          = "t2.micro"
  key_name               = "testkey"
  monitoring             = true
  vpc_security_group_ids = ["sg-0c7118b9026a8b46a"]
  subnet_id              = "subnet-049a8457ce6d6beba"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
