variable "instance_type" {
  description = "Type of instance to launch"
  type        = string

  validation {
    condition     = contains(["t2.micro", "t2.medium", "t3.large"], var.instance_type)
    error_message = "Instance doesnt support"
  }

}

variable "ec2-vol-config" {
  description = "Configuration for the EBS volume"
  type = object({
    size = number
    type = string
  })
}