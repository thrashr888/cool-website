provider "aws" {
  region = "us-east-1"
}

module "s3-website" {
  source  = "thrashr888/s3-website/aws"
  version = "0.4.0"

  bucket_name = "cool-website"
}
  
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  create_bucket = false

  bucket = "cool-website-module"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = false
  }
}

output "website_endpoint" {
  description = "The public url of our cool website"
  value = module.s3-website.website_endpoint
}
