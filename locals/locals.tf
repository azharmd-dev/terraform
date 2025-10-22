locals {
  instance_type =   "t3.micro"
  common_name = "${var.project}-${var.environment}"
  ami_id    =   data.aws_ami.devops_practice.id
  region    =   data.aws_ami.devops_practice.region

}