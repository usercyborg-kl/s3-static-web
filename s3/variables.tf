variable "domain_name" {
    type = string
    description = "s3 domain name"
}
variable "force_destroy" {
    type = bool
    description = "remove s3 with content if this value is true"
}