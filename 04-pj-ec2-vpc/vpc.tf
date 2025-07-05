#tags 
locals {
  tags = {
    CreatedBy   = "Terraform"
    Environment = "Non-Prod"
  }
}


#VPC and Subnet Configuration

resource "aws_vpc" "vpc-non-prod" {
  cidr_block = "10.0.0.0/16"
  tags       = merge(local.tags, { Name = "non-prod-vpc" })
}

# Public Subnet

resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.vpc-non-prod.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  tags              = merge(local.tags, { Name = "non-prod-public-subnet" })
}

# Internet Gateway

resource "aws_internet_gateway" "public-igw" {
  vpc_id = aws_vpc.vpc-non-prod.id
  tags   = merge(local.tags, { Name = "non-prod-public-igw" })
}

# Route Table for Public Subnet

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc-non-prod.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public-igw.id
  }
  tags = merge(local.tags, { Name = "non-prod-public-rt" })
}

# Route Table Association for Public Subnet

resource "aws_route_table_association" "public-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-rt.id
}