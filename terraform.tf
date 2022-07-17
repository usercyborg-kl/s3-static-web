terraform {
  backend "s3" {
    bucket = "remote-state-cryptocode"
    key = "aws-devops/terraform.tfstate"
    region = "us-east-1"
    shared_credentials_file = "/Users/Praveen.T/Desktop/personal/Tech/Terraform/AWS/.aws/creds"
    profile = "personal"
  }
}