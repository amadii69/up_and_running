provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "up-and-run-example" {
  ami           = "ami-07c8c1b18ca66bb07" # The valid AMI ID obtained
  instance_type = "t3.micro"

  tags = {
    Name = "example-instance"
  }
}
