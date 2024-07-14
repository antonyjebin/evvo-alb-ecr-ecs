terraform {
  required_version = "~> 1.9.2"
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.1.0"
        }
    }
}
provider "aws" {
    region                    = var.region
    default_tags {
		tags = var.default_tags
	}
}