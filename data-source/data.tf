data "aws_ami" "devops_practice" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}
output "ami_id" {
  value = data.aws_ami.devops_practice.id
  
}

data "aws_instance" "mongodb" {
    instance_id = "i-0fa661763112b4a9d"
}

output "mongodb_info" {
    value = data.aws_instance.mongodb.public_ip
}