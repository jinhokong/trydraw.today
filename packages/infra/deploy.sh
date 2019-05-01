rm -rf .terraform
rm -rf terraform.tfstate.d
terraform init
terraform workspace new staging
terraform workspace select staging
terraform apply -input=false