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

variable "example_instance_type" {
  default = "t3.micro"
}

resource "aws_instance" "example" {
  ami = "ami-0f9ae750e8274075b"
  instance_type = var.example_instance_type
}
