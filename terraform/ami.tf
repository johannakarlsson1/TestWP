data "aws_ami" "linux" {
	most_recent = true

	filter {
		name = "name"
		values = ["amzn-ami-hvm-*-x86_64-gp2"]
	}

	filter {
		name = "virtualization-type"
		values = ["hvm"]
	}

	filter {
		name = "root-device-type"
		values = ["ebs"]
	}

	owners = ["137112412989"]
}
