module "static-web" {
  source = "./modules/static-site"
  domain_name = "praveengopinathan912022"
  force_destroy = true
}