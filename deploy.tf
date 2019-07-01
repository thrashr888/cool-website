provider "aws" {
  region = "us-east-1"
}

module "s3-website" {
  source  = "thrashr888/s3-website/aws"
  version = "0.4.0"

  bucket_name = "cool-website"
}

output "website_endpoint" {
  description = "The public url of our cool website."
  value = module.s3-website.website_endpoint
}
