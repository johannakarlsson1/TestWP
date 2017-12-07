# Stena Wordpress Base

## Setup

#### Generate and setup deploy-keys for the GitHub
```bash
ssh-keygen -t rsa -b 4096 -f ./terraform/deploy-key -N ""
```
Add the content from deploy-key.pub to the repositories deploy-keys

#### Generate and setup ssh-keys for ec2
```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/EXAMPLE -N ""
```
Add the content of EXAMPLE to lastpass

#### Setup aws profile
```bash
aws configure --profile EXAMPLE
```
Provide tokens for aws account, these are used by terraform and deploy-scripts

#### Update terraform variables
Change the variables in ./terraform/variables.tf to match your needs. provider, name, github_repo, private_key and public_key is required to change

#### Update Makefile
Update the makefile by replacing example with your desierd profile, repo, domain and ssh-key

#### Docker
Modify "docker-compose-production.yml" to match your desired parameters, with domain, names, salts etc.


## Deploy

#### Infrastructure (terraform)
commands run from ./terraform
```bash
terraform apply
```
Add a dns record to your domain pointing to the created ec2 instance

#### Docker
(requires aws profile and ssh-keys)
```bash
make login && make deploy
```
this will deploy the latest version in the git repository


## Development
Put theme development instructions here.
