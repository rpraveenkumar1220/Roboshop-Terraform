dev:
		@git pull
		@rm -rf .terraform
		@terraform init  -backend-config=env-dev/state.tfvars
		@terraform apply -auto-approve  -var-file=env-dev/main.tfvars

dev-destroy:
		@terraform destroy -auto-approve -var-file=env-dev.amin.tfvars

prod:
		@git pull
		@rm -rf .terraform
		@terraform init  -backend-config=env-dev/state.tfvars
		@terraform apply -auto-approve  -var-file=env-prod/main.tfvars