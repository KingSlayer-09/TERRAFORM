resource "aws_instance" "instance" {
  ami           = "ami-05ffe3c48a9991133" # Example AMI ID, replace with a valid one
  instance_type = "t2.micro"
  tags = {
    Name       = "tf-instance"
    CreatedBy = "Terraform"
  }
}