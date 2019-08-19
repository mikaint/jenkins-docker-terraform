# jenkins-docker-terraform
This is Jenkins running on Docker and deployed with Terraform. 

Since we need Jenkins data to be persistent we have to manually create the docker volume and pass the name to terraform as a variable.

## How to run
In order to have dockerized Jenkins up and running you need to run `make up`. This will run a series of commands performing the following actions:
- custom image build
- volume creation
- terraform init, validate, plan and apply (with docker)

You can check the Makefile for the actual commands.

To stop the container just run `make down`

To retrieve password for admin user run `docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword`
