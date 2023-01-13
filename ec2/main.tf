provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my-server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg-web.id]

  tags = {
    Name = "demo-server"
  }

}

resource "aws_security_group" "sg-web" {
  name        = "SSH"
  description = "SSH Route"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow inbound ssh traffic"
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = [var.cidr_block]
  }

  tags = {
    Name = "ssh access"
  }
}