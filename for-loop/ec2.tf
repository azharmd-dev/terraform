resource "aws_instance" "my_ec2" {
      for_each = var.instances
      ami           = "ami-09c813fb71547fc4f" 
      vpc_security_group_ids = [aws_security_group.allow_all.id]
      instance_type = each.value
      region = "us-east-1"
      tags = {
        Name = each.key
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