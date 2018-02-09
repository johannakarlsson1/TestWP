resource "aws_route53_record" "wordpress-a" {
	zone_id = "${var.route53_zone}"
	name = "${var.domain}"
	type = "A"
	ttl = "60"

	records = ["${aws_instance.wordpress.public_ip}"]
}
