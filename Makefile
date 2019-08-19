help:
	@echo "  Available make commands  "
	@echo "---------------------------"
	@echo "up       Build Jenkins"
	@echo "down     Destroy Jenkins"
up:
	docker build -t jenkins:terraform .
	docker volume create jenkins_volume
	docker run -v $(shell pwd):/home -v /var/run/docker.sock:/var/run/docker.sock -w /home hashicorp/terraform:light init
	docker run -v $(shell pwd):/home -v /var/run/docker.sock:/var/run/docker.sock -w /home hashicorp/terraform:light validate
	docker run -v $(shell pwd):/home -v /var/run/docker.sock:/var/run/docker.sock -w /home hashicorp/terraform:light plan -out=tfplan
	docker run -v $(shell pwd):/home -v /var/run/docker.sock:/var/run/docker.sock -w /home hashicorp/terraform:light apply --auto-approve tfplan
down:
	docker run -v $(shell pwd):/home -v /var/run/docker.sock:/var/run/docker.sock -w /home hashicorp/terraform:light destroy --auto-approve
