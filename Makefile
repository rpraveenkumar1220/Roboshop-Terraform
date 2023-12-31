dev:
	@git pull
	@rm -rf .terraform
	@terraform init  -backend-config=env-dev/state.tfvars
	@terraform apply -auto-approve  -var-file=env-dev/main.tfvars


dev-destroy:
	@terraform destroy -auto-approve -var-file=env-dev/main.tfvars

prod:
	@git pull
	@rm -rf .terraform
	@terraform init  -backend-config=env-prod/state.tfvars
	@terraform apply -auto-approve  -var-file=env-prod/main.tfvars

prod-destroy:
	@terraform destroy -auto-approve -var-file=env-prod/main.tfvars