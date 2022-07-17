resource "aws_s3_bucket_website_configuration" "web" {
  bucket = var.domain_name
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": ""
    }
}]
EOF
}