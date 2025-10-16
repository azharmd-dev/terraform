variable "instances" {
 # default = ["mongodb","redis","rabbitmq"] #>> list
    default = { 
      mongodb = "t3.micro"
      redis = "t3.micro"
      mysql = "t3.small"
    } #map
}

variable "zone_id" {
    type = string
    default = "Z0553382WPE1E3VPCYS6"
  
}

variable "domain_name" {
    type = string
    default = "azharprojects.site"
  
}