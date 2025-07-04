resource "aws_s3_bucket" "bucket_name" {
  bucket = "test-${random_id.bucket-suffix.hex}"
  tags = {
      Name        = "TestBucket"
      Environment = "Dev"
      created_by  = "Terraform"
  }
}