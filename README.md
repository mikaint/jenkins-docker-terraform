# jenkins-docker-terraform
This is Jenkins running on Docker and deployed with Terraform. 

Since we need Jenkins data to be persistent we have to manually create the docker volume and pass the name to terraform as a variable.

## How to run
In order to have dockerized Jenkins up and running you need to run the following commands:
- `docker build -t jenkins:terraform .`
- `docker volume create jenkins_volume`
- `terraform init`
- `terraform apply --auto-approve`

or just `make up` which will run those commands

To stop the container run `terraform destroy --auto-approve` or `make down`

To retrieve password for admin user just run `docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword`
