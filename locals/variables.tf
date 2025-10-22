variable "project" {
  default = "azharprojects"
}

variable "environment" {
  default = "dev"
  
}

variable "ami_id" {

  type = string
  default = "ami-09c813fb71547fc4f"
}

variable "region" {
  
  type = string
  default = "us-east-1"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
  
}

variable "common_tags" {
    type = map
    default = {
        Name = "Terraform"
        Terraform = true
        Project = "azharprojects"
        Environment = "dev"    }
}

variable "sg_tags" {
    type = string
    default = "allow_all"
    description = "Allow all traffic"
  
}

variable "cidr" {
    type = list 
    default = ["0.0.0.0/0"] #internet
  
}

variable "ingress_engress" {
    default = 0
  
}
  variable "protocol" {
    type = string
    default = "-1"
  }