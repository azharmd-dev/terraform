resource "aws_security_group" "strict_rule" {
  name        = "strict_rule"
  description = "Allow specific inbound traffic and outbound traffic"

  tags = {
    Name = "strict_rule"
    Terraform = "true"
  }

#Block
  egress {
    from_port       = 0 # from 0 to all ports
    to_port         = 0
    protocol        = "-1" # for all ports
    cidr_blocks      = ["0.0.0.0/0"] #internet
  }

dynamic "ingress" {
        for_each = toset(var.ingress_ports)
        content {
            from_port   = ingress.value
            to_port     = ingress.value
            protocol    = "tcp"
            cidr_blocks = [ "0.0.0.0/0" ]
        }
    }
}