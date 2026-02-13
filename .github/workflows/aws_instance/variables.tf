# AMI ID
#####################################
variable "ami" {
  description = "ami-0c1fe732b5494dc14"
  type        = string
  default     = "ami-0c1fe732b5494dc14" # Amazon Linux 2 (us-east-1)
}

#####################################
# Instance Type
#####################################
variable "instance_type" {
  description = "t3.micro"
  type        = string
  default     = "t3.micro"
}

#####################################
# Key Pair Name
#####################################
variable "key_name" {
  description = "web-ser"
  type        = string
  default     = "web-ser"
}

#####################################
# Security Groups
#####################################
variable "security_groups" {
  description = "List of security group names"
  type        = list(string)
  default     = ["loabalancer-sg"]

}
