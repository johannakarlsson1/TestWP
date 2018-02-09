#!/usr/bin/env bash

yum update -y
yum install docker git -y
service docker start
usermod -aG docker ec2-user

curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod 755 /usr/local/bin/docker-compose

runuser -l ec2-user -c 'aws s3 cp s3://${s3_bucket}/id_rsa ~/.ssh/id_rsa'
runuser -l ec2-user -c 'chmod 400 ~/.ssh/id_rsa'

runuser -l ec2-user -c 'ssh-keyscan github.com >> ~/.ssh/known_hosts'
runuser -l ec2-user -c 'git clone git@github.com:${github_repo}.git'
runuser -l ec2-user -c 'chmod -R 777 */web/app/uploads'

runuser -l ec2-user -c 'aws s3 cp s3://${s3_bucket}/docker-compose-production.yml ~/${name}/'
runuser -l ec2-user -c 'echo "export DB_HOST=${mysql_address}" >> ~/.bashrc'
runuser -l ec2-user -c 'echo "export DB_PASSWORD=${rds_password}" >> ~/.bashrc'
