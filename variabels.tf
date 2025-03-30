## section for the provider
variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"

  validation {
    condition     = contains(["us-east-1", "us-east-2"," us-west-1","us-west-2"], var.aws_region)
    error_message = "Unsupported AWS Region specified. Supported regions include: us-east-1, us-east-2, us-west-1, us-west-2."
  }
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}



## section for the connection to instance, his get the pub key. and the machine connect true it.
variable "path_to_private_key" {
  default = ".vpc_demo_keys/my_key"
}

variable "path_to_public_key" {
  default = ".vpc_demo_keys/my_key.pub"
}



##AMIs for each of the region, if for some reason the region has been changed
variable "AMIS" {
  type = map
  default = {
    us-east-1 = "ami-0b0ea68c435eb488d"
    us-east-2 = "ami-05803413c51f242b7"
    us-west-1 = "ami-0454207e5367abf01"
    us-west-2 = "ami-0688ba7eeeeefe3cd"
  }
}