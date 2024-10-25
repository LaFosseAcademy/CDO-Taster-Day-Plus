terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "http_server" {
  ami                    = "ami-01b799c439fd5516a"
  key_name               = "default-ec2"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.http_server_sg.id]
  subnet_id              = data.aws_subnets.default_subnets.ids[0]

  # Connection block for SSH
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.aws_key_pair)
  }

  # Provisioner to copy files
  provisioner "file" {
    source      = "../docker-compose.yml"
    destination = "/home/ec2-user/docker-compose.yml"
  }

}

# Variable to hold the AWS key pair path
variable "aws_key_pair" {
  default = "~/aws/aws_keys/default-ec2.pem"
}