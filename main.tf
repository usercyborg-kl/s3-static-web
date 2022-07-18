module "static-web" {
  source = "./deploy/static-site"
  domain_name = "praveengopinathan912022"
  force_destroy = true
}