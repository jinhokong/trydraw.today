resource "aws_s3_bucket" "web-s3" {
  bucket = "trydraw.today"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

resource "aws_s3_bucket_policy" "web-s3-policy" {
  bucket = "${aws_s3_bucket.web-s3.bucket}"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action":"s3:GetObject",
            "Resource": [
                "arn:aws:s3:::${aws_s3_bucket.web-s3.bucket}/*"
            ]
        }
    ]
}
POLICY
}
