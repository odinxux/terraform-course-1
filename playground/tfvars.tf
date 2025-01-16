variable "region" {
  description = "The region in which the resources will be created"
  default     = "eu-west-2"
}
variable "profile" {
  description = "The profile to use for the AWS provider"
  default     = "odinux"
}
#public subnets
variable "public_subnets" {
  description = "The public subnets to use"
  type        = list(string)
  default     = ["172.21.0.0/24", "172.21.1.0/24", "172.21.2.0/24"]
}
#private subnents
variable "private_subnets" {
  description = "The private subnets to use"
  type        = list(string)
  default     = ["172.21.100.0/24", "172.21.101.0/24", "172.21.102.0/24"]
}
variable "vpc_name" {
    description = "The name of the VPC to create"
    type        = string
    default     = "playground-vpc"
}
variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string
    default     = "172.21.0.0/16"
}
variable "instance_types" {
  description = "The type of instance to create"
  type        = map
  default     = {
    "t2" = "t2.micro"
    "t3" = "t3.micro"
    "t3nano" = "t3.nano"
  } 
}
variable "SSH_PUBLIC_KEY_PATH" {
  description = "The path to the public key used for SSH access"
  type        = string
  default     = "~/.ssh/id_rsa.pub"  
}
variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}