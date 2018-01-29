variable "name" {
	default = "wordpress-EXAMPLE"
}

variable "github_repo" {
	default = "StenaIT/wordpress-EXAMPLE"
}

variable "ec2_instance_type" {
	default = "t2.micro"
}

variable "rds_instance_type" {
	default = "db.t2.micro"
}

variable "private_key" {
	default = "~/.ssh/EXAMPLE"
}

variable "public_key" {
	default = "~/.ssh/EXAMPLE.pub"
}

variable "secrets_bucket" {
	default = "stenait-wordpress-EXAMPLE-secrets"
}

# export TF_VAR_rds_password="xxxx"
variable "rds_password" {}
