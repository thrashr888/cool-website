variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_default_region" {}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_default_region}"
}

module "s3-website" {
  source  = "thrashr888/s3-website/aws"
  version = "0.2.0"

  bucket_name = "cool-website"
}

output "website_endpoint" {
  value = "${module.s3-website.website_endpoint}"
}
