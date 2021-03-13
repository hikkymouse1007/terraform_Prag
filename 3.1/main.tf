provider "aws" {
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_KEY
  region     = var.REGION
}

variable "ACCESS_KEY" {
      type = string
}

variable "SECRET_KEY" {
      type = string
}

variable "REGION" {
      type = string
}

resource "aws_instance" "example" {
  ami = "ami-0f9ae750e8274075b"
  instance_type = "t3.micro"

  user_data = <<EOF
    #! /bin/bash
    yum install -y httpd
    systemctl start httpd.service
EOF
}
