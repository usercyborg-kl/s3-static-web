output "website-s3" {
    value =  {
        "Endpoint" = module.static-web.domain_url.website_endpoint
    }    
}

