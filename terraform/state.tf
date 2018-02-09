resource "aws_s3_bucket" "terraform-remote-state-storage" {
	bucket = "EXAMPLE-terraform-remote-state-storage"
	acl = "private"
	versioning {
		enabled = true
	}
	lifecycle {
		prevent_destroy = true
	}
	tags {
		Name = "S3 Remote Terraform State Store"
	}
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
	name = "EXAMPLE-terraform-state-lock-dynamo"
	hash_key = "LockID"
	read_capacity = 20
	write_capacity = 20
	attribute {
		name = "LockID"
		type = "S"
	}
	tags {
		Name = "DynamoDB Terraform State Lock Table"
	}
}

terraform {
	backend "s3" {
		bucket  = "EXAMPLE-terraform-remote-state-storage"
		key = "terraform.tfstate"
		region  = "eu-west-1"
		encrypt = true
		dynamodb_table = "EXAMPLE-terraform-state-lock-dynamo"
		profile = "EXAMPLE"
	}
}
