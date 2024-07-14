terraform {
  backend "s3" {
    bucket         = "evvo-bucket"
    key            = "state/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
  }
}
