rm -rf .terraform
rm -rf terraform.tfstate.d
TF_LOG = DEBUG terraform init
terraform workspace new staging
terraform workspace select staging
terraform apply -input=false