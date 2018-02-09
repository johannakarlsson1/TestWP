data "template_file" "iam" {
	template = "${file("templates/aws_iam_policy.tpl")}"

	vars {
		s3_bucket = "${aws_s3_bucket.terraform-remote-state-storage.bucket}"
	}
}

resource "aws_iam_instance_profile" "default" {
	name = "${var.name}"
	role = "${aws_iam_role.default.name}"
}

resource "aws_iam_role" "default" {
	name = "${var.name}"
	assume_role_policy = "${file("templates/aws_iam_role")}"
}

resource "aws_iam_role_policy" "s3" {
	name = "${var.name}"
	role = "${aws_iam_role.default.name}"
	policy = "${data.template_file.iam.rendered}"
}
