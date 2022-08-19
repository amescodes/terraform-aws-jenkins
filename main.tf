terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.26.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
}

variable "domain_name" {
  description = "The name of the domain for our website."
  default = "amescodes.org"
}

resource "aws_s3_bucket" "website" {
  bucket = var.domain_name
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid = "PublicReadGetObject"
    effect = "Allow"
    actions = [ "s3:GetObject" ]
    principals {
      type = "*"
      identifiers = [ "*" ]
    }
    resources = [ "arn:aws:s3:::${var.domain_name}/*" ]
  }
}

resource "aws_s3_bucket_policy" "allow_access" {
  bucket = aws_s3_bucket.website.bucket
  policy = data.aws_iam_policy_document.bucket_policy.json
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = var.domain_name
  
  index_document {
    suffix = "index.htm"
  }

  error_document {
    key = "error.htm"
  }
}

output "website_bucket_url" {
  value = aws_s3_bucket_website_configuration.website_config.website_endpoint
}