# Generate bootstrap file
data "template_file" "bootstrap" {
	template = "${file("templates/bootstrap.tpl")}"

	vars {
		name = "${var.name}"
		mysql_address = "${aws_db_instance.mysql.address}"
		github_repo = "${var.github_repo}"
		s3_bucket = "${aws_s3_bucket.terraform-remote-state-storage.bucket}"
		rds_password = "${var.rds_password}"
	}
}

resource "aws_instance" "wordpress" {
	ami = "${data.aws_ami.linux.id}"
	instance_type = "${var.ec2_instance_type}"
	key_name = "${aws_key_pair.wordpress.id}"
	vpc_security_group_ids = ["${aws_security_group.wordpress.id}"]

	iam_instance_profile = "${aws_iam_instance_profile.default.id}"
	user_data = "${data.template_file.bootstrap.rendered}"

	tags { Name = "${var.name}" }
	root_block_device { volume_size = 20 }

	depends_on = ["aws_db_instance.mysql"]
}
