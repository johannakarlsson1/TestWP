login:
	$$(aws ecr get-login --no-include-email --profile example)

deploy:
	ssh ec2-user@example.com -i ~/.ssh/example -oStrictHostKeyChecking=no "cd wordpress-example && git pull && $$(aws ecr get-login --no-include-email) && docker-compose -f docker-compose-production.yml up -d"

ssh:
	ssh -i ~/.ssh/example ec2-user@example.com
