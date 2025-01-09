#variables declaration
variable "region" {
  description = "The region in which the resources will be created"
  default     = "eu-west-2"
}
variable "instance_type" {
  description = "The type of instance to create"
  type        = map
  default     = {
    "t2" = "t2.micro"
    "t3" = "t3.micro"
  } 
}
variable "profile" {
  description = "The profile to use for the AWS provider"
  default     = "odinux"
}
###region avz we use in default###
#avz setup staticly as well subnets
variable "availability_zones" {
  description = "The availability zones to use"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}
###default vpc setup ### 
variable "vpc_name" {
    description = "The name of the VPC to create"
    type        = string
    default     = "tst-proj-vpc"
}
variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string
    default     = "172.20.0.0/16"
}

#public subnets
variable "public_subnets" {
  description = "The public subnets to use"
  type        = list(string)
  default     = ["172.20.0.0/24", "172.20.1.0/24", "172.20.2.0/24"]
}
#private subnents
variable "private_subnets" {
  description = "The private subnets to use"
  type        = list(string)
  default     = ["172.20.100.0/24", "172.20.101.0/24", "172.20.102.0/24"]
}

