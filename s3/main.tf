resource "aws_s3_bucket" "website_bucket" {
  bucket = var.domain_name
  acl = "public-read"
  policy = data.aws_iam_policy_document.website_policy.json
  force_destroy = var.force_destroy
}

data "aws_iam_policy_document" "website_policy" {
  statement {
    actions = [
      "s3:GetObject"
    ]
    principals {
      identifiers = ["*"]
      type = "AWS"
    }
    resources = [
      "arn:aws:s3:::${var.domain_name}/*"
    ]
  }
}
resource "aws_s3_bucket_website_configuration" "web" {
  bucket = var.domain_name

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
  depends_on = [
    aws_s3_bucket.website_bucket
  ]
}

resource "aws_s3_object" "index" {
  bucket = var.domain_name
  key  = "index.html"
  source = "dist/index.html"
  content_type = "text/html"
  force_destroy = var.force_destroy
  depends_on = [
    aws_s3_bucket.website_bucket
  ]
}

resource "aws_s3_object" "error" {
  bucket = var.domain_name
  key = "error.html"
  source = "dist/error.html"
  content_type = "text/html"
  force_destroy = var.force_destroy
  depends_on = [
    aws_s3_bucket.website_bucket
  ]
}
