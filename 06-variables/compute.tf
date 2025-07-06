resource "aws_instance" "compute-instance" {
    ami           = data.aws_ami.compute-ami.id
    instance_type = "t2.micro"

    tags = {
      Name = "ComputeInstance"
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