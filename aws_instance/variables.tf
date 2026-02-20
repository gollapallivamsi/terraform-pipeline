variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket (must be globally unique)"
  type        = string
  default     = "my-practice-bucket-123456789"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

