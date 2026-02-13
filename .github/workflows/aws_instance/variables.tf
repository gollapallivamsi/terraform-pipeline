# AMI ID
#####################################
variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c02fb55956c7d316" # Amazon Linux 2 (us-east-1)
}

#####################################
# Instance Type
#####################################
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

#####################################
# Key Pair Name
#####################################
variable "key_name" {
  description = "Name of the existing AWS Key Pair"
  type        = string
  default     = "my-keypair"
}

#####################################
# Security Groups
#####################################
variable "security_groups" {
  description = "List of security group names"
  type        = list(string)
  default     = ["default"]
}