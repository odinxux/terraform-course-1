resource "aws_s3_bucket" "tfstate" {
  bucket = "odin-tfstate-8.1.25"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}
