login:
	$$(aws ecr get-login --no-include-email --profile example)

deploy:
	ssh ec2-user@example.com -i ~/.ssh/example -oStrictHostKeyChecking=no "cd example && git pull && make login && docker-compose -f docker-compose-production.yml up -d"
