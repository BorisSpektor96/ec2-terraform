variable "instance_type" {
  description = "The instance type"
  type = string
  default = "t2.micro"
}

variable "vpc_id" {
  description = "The vpc id"
  type = string
}

variable "key_name" {
  description = "SSH key pair name"
  type = string
}

variable "key_path" {
  description = "path to the SSH key"
  type = string
}

variable "region" {
  description = "my region"
  type = string
  default = "us-east-1a"
}

# variable "ebs_region" {
#   description = "my volume region"
#   type = string
#   default = "us-east-1a"
# }

variable "ebs_volume_size" {
  description = "ebs_volume_size"
  type = number
  default = 30
}