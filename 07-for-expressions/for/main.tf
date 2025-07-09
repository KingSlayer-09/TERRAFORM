locals {
  instance_names = [for i in range(var.instance_count) : "web-${i + 1}"]
}

resource "aws_instance" "web_instances" {
  count         = var.instance_count
  ami           = data.aws_ami.compute-ami.id
  instance_type = "t2.micro"

  tags = {
    Name = local.instance_names[count.index]
    Role = "frontend"
    CreatedBy = "Terraform"
  }
}

data "aws_ami" "compute-ami" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.7.2025*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}