resource "aws_security_group" "wordpress" {
	name = "${var.name}"
	description = "Allow in/out 80, 22, 443"
	tags { Name = "${var.name}" }

	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["194.17.229.129/32", "212.181.124.157/32", "194.103.125.4/32"]
	}

	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		from_port = 443
		to_port = 443
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		from_port = 3306
		to_port = 3306
		protocol = "tcp"
		self = true
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}
