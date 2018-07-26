variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_default_region" {}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_default_region}"
}

resource "aws_s3_bucket" "static_site" {
  bucket = "cool-website"
  acl    = "public-read"

  website {
    // DO NOT CHANGE THESE
    index_document = "indx.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket       = "${aws_s3_bucket.static_site.bucket}"
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
  etag         = "${md5(file("index.html"))}"
  acl          = "public-read"
}

resource "aws_s3_bucket_object" "error" {
  bucket       = "${aws_s3_bucket.static_site.bucket}"
  key          = "error.html"
  source       = "error.html"
  content_type = "text/html"
  etag         = "${md5(file("error.html"))}"
  acl          = "public-read"
}

output "website" {
  value = "${aws_s3_bucket.static_site.website_endpoint}"
}
