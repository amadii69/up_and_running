provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "up-and-run-example" {
  ami           = "ami-07c8c1b18ca66bb07" # The valid AMI ID obtained
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  user_data = <<-EOF
  	#!/bin/bash
  	echo "Hello, World" > index.xhtml
  	nohup busybox httpd -f -p 8080 &
  	EOF
  user_data_replace_on_change = true

  tags = {
    Name = "example-instance"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }  

}
