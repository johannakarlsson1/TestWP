resource "aws_db_instance" "mysql" {
	identifier = "${var.name}"
	allocated_storage = 10
	storage_type = "gp2"
	multi_az = "false"
	engine = "mysql"
	engine_version = "5.7.19"
	instance_class = "${var.rds_instance_type}"
	name = "wordpress"
	username = "root"
	password = "${var.rds_password}"
	vpc_security_group_ids = ["${aws_security_group.wordpress.id}"]
	backup_retention_period = 7
	publicly_accessible = true
	skip_final_snapshot = true
	apply_immediately = true
}
