terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.70.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"  # Set your region
}

resource "aws_iam_policy" "s3_bucket_lifecycle_policy" {
  name        = "s3-bucket-lifecycle-policy"
  description = "Policy to allow lifecycle management on the S3 bucket"
  policy      = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "s3:GetLifecycleConfiguration",
          "s3:PutLifecycleConfiguration",
          "s3:DeleteLifecycleConfiguration"
        ],
        "Resource": "arn:aws:iam::216989100170:policy/S3_bucket_creation"  # Replace with your bucket ARN
      }
    ]
  })
}

resource "aws_iam_user" "example_user" {
  name = "aws-examples"
}

resource "aws_iam_user_policy_attachment" "example_attach" {
  user       = aws_iam_user.example_user.name
  policy_arn = aws_iam_policy.s3_bucket_lifecycle_policy.arn
}
