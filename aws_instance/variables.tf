# AMI ID
#####################################
variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c1fe732b5494dc14" # Amazon Linux 2 (us-east-1)
}

#####################################
# Instance Type
#####################################
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

#####################################
# Key Pair Name
#####################################
variable "key_name" {
  description = "Name of the existing AWS Key Pair"
  type        = string
  default     = "web-ser"
}

#####################################
# Security Groups
#####################################
variable "security_groups" {
  description = "List of security group names"
  type        = list(string)
  default     = ["sg-0b8483d20f7e4c77a"]

}
