resource "aws_instance" "my_ec2" {
      ami           = local.ami_id
      vpc_security_group_ids = [aws_security_group.allow_all.id]
      instance_type = local.instance_type
      region = local.region
      tags = merge(
        var.common_tags,
        {
          environment  = "${local.common_name}-local-demo"
        }
      )
    }

resource "aws_security_group" "allow_all" {
  name        = "${local.common_name}-local-demo"
  description = "Allow all inbound traffic and all outbound traffic"

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

  tags = merge(
        var.common_tags,
        {
          environment  = "${local.common_name}-local-demo"
        }
      )
}


