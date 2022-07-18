# s3-static-web

This code implements the static [web hosting](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html) in terraform. This will implement only web hostin with 
the s3 endpoint. The advancement can be added here where we add AWS CloudFront for CDN, Custom domains and SSL certificates with Route53 and ACM. 

Code here can be ran with a module defined in main.tf at the root level.
```
module "static-web" {
  source = "./s3"
  domain_name = "praveengopinathan912022"
  force_destroy = true
}
```
All state files are maintained with s3 as backend provider with only private access. And with the help of a dynamoDB table, we can setup terraform state lock when we add collaborators to the project.
Once the terraform execution is complete, an output.tf at the root level will display the s3 website endpoint.
