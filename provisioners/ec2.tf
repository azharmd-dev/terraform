resource "aws_instance" "my_ec2" {
      ami           = "ami-09c813fb71547fc4f" 
      vpc_security_group_ids = [aws_security_group.allow_all.id]
      instance_type = "t3.micro"
      region = "us-east-1"
      tags = {
        Name = "Terraform"
        Terraform = "true"
      }
    provisioner "local-exec"{
      command = "echo ${self.private_ip} > inventory"
      on_failure = continue
    }

    provisioner "local-exec"{
      command = "echo Instance is destroyed"
      when    = destroy
    }

    connection {
    type        = "ssh"
    user        = "ec2-user"
    password = "DevOps321"
    host        = self.public_ip
  }

   provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }
  provisioner "remote-exec" {
      inline = [
        "sudo systemctl stop nginx",
        "echo 'successfully stopped nginx server' "
      ]
      when = destroy
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