# Convert the map into a list of objects with environment, type, and name
locals {
  instance_configs = [
    for env, type in var.instances : {
      name          = "server-${env}"
      environment   = env
      instance_type = type
    }
  ]
}

resource "aws_instance" "env_instances" {
  for_each = {
    for config in local.instance_configs :
    config.environment => config
  }

  ami           = "ami-05ee755be0cd7555c"  # change as per region
  instance_type = each.value.instance_type

  tags = {
    Name        = each.value.name
    Environment = each.value.environment
    CreatedBy   = "Terraform"
  }
}