terraform {
  required_version = ">=0.14.9"
  required_providers {
#    aws = {
#      source  = "hashicorp/aws"
#      Version = "~>3.27"
       aws = "~> 1.0"
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

provisioner "remote-exec" {
    inline = [
      "sudo docker run yp3yp3/github:latest",
    ]
  }

  tags = {
    Name = "my-app"
  }
}
