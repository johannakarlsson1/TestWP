# Stena Wordpress Base

## Setup

#### Generate and setup ssh-keys
```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/EXAMPLE -C "wpadmin@stena.com" -N ""
```
Add the content of EXAMPLE to lastpass (to store for other team members)

#### GitHub add deploy key
Add the newly generated public key to your GitHub repos deplot keys.

#### Setup aws profile
```bash
aws configure --profile EXAMPLE
```
Provide tokens for aws account, these are used by terraform

#### Update terraform variables
Change the variables in
- ./terraform/variables.tf
- ./terraform/state.tf
to match your needs. (replace EXAMPLE)

#### Deploy terraform
```bash
terraform init
terraform apply
```
move tfstate to s3 bucket by first uncommenting the terraform block in ./terraform/state.tf and then running
```bash
terraform init
```

#### Docker
Modify "docker-compose-production.yml.example" to match your desired parameters, with domain, names, salts and upload to s3 bucket.

#### Update Makefile
Update the makefile by replacing example with your desierd profile, repo, domain and ssh-key
Upload the earlier generated ssh-key as "id_rsa" to the s3 bucket

## Deploy

#### Docker
(requires aws profile and ssh-keys)
```bash
make login && make deploy
```
this will deploy the latest version in the git repository


## Development
Put theme development instructions here.
