
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = "10.0.1.0/24"
}