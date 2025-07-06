variable "instance_type" {
  description = "Type of instance to launch"
  type        = string
  default     = "t2.micro"

  validation {
    condition = var.instance_type == "t2.micro" || var.instance_type == "t3.micro"
    error_message = "Instance type must be either 't2.micro' or 't3.micro'."
  }
  
}

variable "volume_size" {
  description = "Size of the EBS volume in GB"
  type        = number
}