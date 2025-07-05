locals {
  ec2_tags = {
    CreatedBy   = "Terraform"
    Environment = "Non-Prod"
  }
}


# EC2 Instance Configuration

resource "aws_instance" "virtual-machine" {
  ami                    = "ami-05ee755be0cd7555c" # Example AMI ID, replace with a valid one
  instance_type          = "t2.micro"
  associate_public_ip_address = true
  subnet_id              = aws_subnet.public-subnet.id
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  root_block_device {
    delete_on_termination = true
  }

  # User data for initial setup
 user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl enable httpd
              systemctl start httpd

              cat <<EOT > /var/www/html/index.html
              <html>
              <head><title>Welcome</title></head>
              <body>
                <marquee>Kya be chotte lulli ke jayega na vandri lake</marquee>
              </body>
              </html>
              EOT
              EOF


  tags = merge(local.ec2_tags, { Name = "non-prod-ec2-instance" })

}


# Security Group for EC2 Instance

resource "aws_security_group" "ec2-sg" {
  name        = "non-prod-ec2-sg"
  description = "Security group for non-prod EC2 instance"
  vpc_id      = aws_vpc.vpc-non-prod.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
