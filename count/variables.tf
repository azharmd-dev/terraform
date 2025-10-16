variable "instances" {
  default = ["mongodb","redis","rabbitmq"]
}

variable "zone_id" {
    type = string
    default = "Z0553382WPE1E3VPCYS6"
  
}

variable "domain_name" {
    type = string
    default = "azharprojects.site"
  
}