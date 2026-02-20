# AMI ID
#####################################
variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c1fe732b5494dc14" # Amazon Linux 2 (us-east-1)
}

#####################################
# Instance Typevariable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket (must be globally unique)"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}
#####################################
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}





