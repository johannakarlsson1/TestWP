provider "aws" {
	region = "eu-west-1"
	shared_credentials_file = "~/.aws/credentials"
	profile = "stena"
}

variable "name" {
	default = "wordpress-base"
}

variable "github_repo" {
	default = "StenaIT/wordpress-base"
}

variable "ec2_instance_type" {
	default = "t2.micro"
}

variable "rds_instance_type" {
	default = "db.t2.micro"
}

variable "private_key" {
	default = "~/.ssh/wordpress"
}

variable "public_key" {
	default = "~/.ssh/wordpress.pub"
}
