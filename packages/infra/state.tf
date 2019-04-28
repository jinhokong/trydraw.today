provider "aws" {
  region  = "ap-northeast-2"
  profile = "jinho"
}

terraform {
  required_version = "= 0.11.11"

  backend "s3" {
    key            = "./.terraform/terraform.tfstate"
    region         = "ap-northeast-2"
    acl            = "bucket-owner-full-control"
    dynamodb_table = "Terraform-Lock"
    bucket         = "trydrawtoday-tfstate"
  }
}

resource "aws_dynamodb_table" "Terraform-Lock" {
  name         = "Terraform-Lock"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "trydrawtoday"
  }
}

resource "aws_s3_bucket" "logs" {
  bucket = "trydrawtoday-tflogs"
  acl    = "log-delivery-write"

  tags = {
    Name = "trydrawtoday"
  }
}

resource "aws_s3_bucket" "terraform-state" {
  bucket = "trydrawtoday-tfstate"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags {
    Name = "trydrawtoday"
  }

  logging {
    target_bucket = "${aws_s3_bucket.logs.id}"
    target_prefix = "log/"
  }

  #   lifecycle {
  #     prevent_destroy = true
  #   }
}
