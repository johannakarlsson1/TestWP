# Config need for Terraform remote state backend
terraform {
	backend "s3" {
		bucket  = "stena-terraform-remote-state-EXAMPLE"
		key = "terraform.tfstate"
		region  = "eu-west-1"
		encrypt = true
		profile = "EXAMPLE"
	}
}

provider "aws" {
	region = "eu-west-1"
	shared_credentials_file = "~/.aws/credentials"
	profile = "EXAMPLE"
}
