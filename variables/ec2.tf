resource "aws_instance" "my_ec2" {
      ami           = var.ami_id
      vpc_security_group_ids = [aws_security_group.allow_all.id]
      instance_type = var.instance_type
      region = var.region
      tags = var.ec2_tags
    }

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic and all outbound traffic"

  tags = var.ec2_tags

  egress {
    from_port       = var.ingress_engress # from 0 to all ports
    to_port         = var.ingress_engress
    protocol        = "-1" # for all ports
    cidr_blocks      = var.cidr #internet
  }

    ingress {
    from_port       = var.ingress_engress# from 0 to all ports
    to_port         = var.ingress_engress
    protocol        = "-1" # for all ports
    cidr_blocks      = var.cidr
  }
}


