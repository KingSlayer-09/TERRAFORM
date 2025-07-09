resource "aws_instance" "compute-instance" {
  ami           = data.aws_ami.compute-ami.id
  instance_type = var.instance_type
  root_block_device {
    delete_on_termination = true
    volume_size           = var.ec2-vol-config.size
    volume_type           = var.ec2-vol-config.type
  }
  tags = local.tags
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