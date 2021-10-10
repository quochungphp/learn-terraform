# Init terraform before start project

`$ terraform init`

# Check terraform before apply

`$ terraform plan`

# Build infrastructure

`$ terraform apply`

# Build infrastructure and auto approve

`$ terraform apply --auto-approve`

# Structure

--modules
--- sub-module-name}
------- main.tf
------- variables.tf
------- output.tf
--main.tf
--terraform.tf
--variables.tf
