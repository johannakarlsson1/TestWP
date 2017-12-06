resource "aws_instance" "wordpress" {
	ami = "${data.aws_ami.linux.id}"
	instance_type = "${var.ec2_instance_type}"
	key_name = "${aws_key_pair.wordpress.id}"
	vpc_security_group_ids = ["${aws_security_group.wordpress.id}"]
	tags { Name = "${var.name}" }

	depends_on = ["aws_db_instance.mysql"]

	connection {
		user = "ec2-user"
		private_key = "${file("${var.private_key}")}"
	}

	provisioner "file" {
		source = "deploy-key"
		destination = "~/.ssh/id_rsa"
	}

	provisioner "remote-exec" {
		inline = [
			"sudo yum update",
			"sudo yum install docker git -y",
			"sudo service docker start",
			"sudo usermod -aG docker $USER",
			"sudo curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose",
			"sudo chmod +x /usr/local/bin/docker-compose",
			"chmod 400 ~/.ssh/id_rsa",
			"ssh-keyscan github.com >> ~/.ssh/known_hosts",
			"git clone git@github.com:${var.github_repo}.git",
			"chmod -R 777 */web/app/uploads",

			"aws configure set aws_access_key_id AKIAILJRKAHAQ65QRIIA",
			"aws configure set aws_secret_access_key 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",
			"aws configure set default.region eu-west-1",

			"echo 'export DB_HOST=${aws_db_instance.mysql.address}' >> ~/.bashrc"
		]
	}
}
