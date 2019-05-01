rm -rf .terraform
rm -rf terraform.tfstate.d
aws configure get aws_access_key_id --profile trydrawtoday
terraform init
terraform workspace new staging
terraform workspace select staging
terraform apply -input=false