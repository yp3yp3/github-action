terraform {
  required_version = ">=0.11.9"
  required_providers {
#    aws = {
#      source  = "hashicorp/aws"
#      Version = "~>3.27"
       aws = "~> 2.48"
#    }
  }

 backend "s3" {
    bucket         	   = "terra-test12"
    key              	   = "state/terraform.tfstate"
    region         	   = "us-east-1"

  }
}


provider "aws" {
  region  = "us-east-1"

}


resource "aws_instance" "example_server" {
  ami = "ami-0fa07436ad11fff06"
  instance_type = "t2.micro"
  user_data = <<-EOF
		#! /bin/bash
		sudo docker run yp3yp3/github:latest
  EOF

  tags = {
    Name = "my-app"
  }
}
