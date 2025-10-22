resource "aws_instance" "my_ec2" {
      count = 2
      # count = length(var.instances)
      ami           = "ami-09c813fb71547fc4f" 
      vpc_security_group_ids = [aws_security_group.allow_all.id]
      instance_type = "t3.micro"
      region = "us-east-1"
      tags = {
        Name = var.instances[count.index] #It will take index 0 to 1 from the instances variables 
        Terraform = "true"
      }
    }

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_all"
    Terraform = "true"
  }

  egress {
    from_port       = 0 # from 0 to all ports
    to_port         = 0
    protocol        = "-1" # for all ports
    cidr_blocks      = ["0.0.0.0/0"] #internet
  }

    ingress {
    from_port       = 0 # from 0 to all ports
    to_port         = 0
    protocol        = "-1" # for all ports
    cidr_blocks      = ["0.0.0.0/0"]
  }
}