help:
	@echo "  Available make commands  "
	@echo "---------------------------"
	@echo "up       Build Jenkins"
	@echo "down     Destroy Jenkins"
up:
	docker volume create jenkins_volume
	terraform validate
	terraform plan -out=tfplan
	terraform apply --auto-approve tfplan
down:
	terraform destroy --auto-approve
