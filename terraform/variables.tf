# AWS credentials
provider "aws" {
	region = "eu-west-1"
	shared_credentials_file = "~/.aws/credentials"
	profile = "EXAMPLE"
}

# Project Name
variable "name" {
	default = "EXAMPLE"
}

# Domain Name
variable "domain" {
	default = "EXAMPLE.com"
}

# Github Repo (must be same as project name)
variable "github_repo" {
	default = "StenaIT/wordpress-EXAMPLE"
}

# Route 53 Zone ID
variable "route53_zone" {
	default = "Z3V1E2F3PGT0AQ"
}

# Ec2 Instance Type
variable "ec2_instance_type" {
	default = "t2.micro"
}

# Rds Instance type
variable "rds_instance_type" {
	default = "db.t2.micro"
}

# Private Key Location
variable "private_key" {
	default = "~/.ssh/EXAMPLE"
}

# Public Key Location
variable "public_key" {
	default = "~/.ssh/EXAMPLE.pub"
}

# export TF_VAR_rds_password="xxxx"
variable "rds_password" {}
