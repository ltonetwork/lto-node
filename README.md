LegalThings One Node
===

Requirements
---

- [Docker](https://www.docker.com/)
- [Docker compose >= v3.0](https://docs.docker.com/compose/)

_You can optain the latest version of `docker-compose` using pip._

Run on a (virtual) machine
---

Running the node using docker compose it will initiate all service including a mongodb database. Beware that if you
destory the mongodb container all your data will be lost.

    docker-compose up
    
Docker compose is configured to run the node on a local machine on port 80. If you would like to run the node on different
port you will need to change the `docker-compose.yml` to

    ports:
        - "<your-port>:3000"

This way the node will be accessible via port 80.

Or you can use a reverse proxy like NGINX to make the node publicly available. This is highly recommended. 

Run on EC2 
---

To Run the not on a AWS EC2 instance we have included an install script will bootstrap your ec2 instance. To use this script
you will need to select the following AMI: ami-c91624b0.

So to run a node on a EC2 instance you can perform the following steps:

1. Click "Launch Instance" and select ami-c91624b0 from the 'Community AMIs'
2. Select an instance type, currently a t2.micro is sufficient.
3. Configure instance, here 2 things are important.
  - The node requires a public ip
  - Under the "Advanced Details" tab you need to upload the provided `install_ec2.sh` file (this will installed the node)
4. Adding storage is different depending on whether you will run an external mongo service. If you choose the default, select
atleast 15 Gb of storage.
5. For the security group make sure the node can be accessed on port 80
6. You are ready to run launch the instance.

Run in AWS Elastic Beanstalk
---
Running the node using AWS Elastic Beanstalk (EB) it will only install the services on a machine. You will have to provide
a Mongo Database your self. 

Take to following steps to install the node on EB:

1. Zip the Dockerrun.aws.json file
2. Create an application
3. Inside the created application, create an environment: `webserver environment`
4. Select following settings:
 - Platform: Multi-container Docker
 - Upload the zipped file
5. Configure more options
6. Software -> Environment properties:
    - Name: `APPLICATION_ENV`, Value: `lto`
    - Name: `MONGO_DB`, Value: `"<Your mongodb connection string>"` 

Now your node should good to go!

Server
---

The server will be running on `http://localhost:3000/`

Services
---

| Service       | Url           |
| ------------- |---------------|
| LegalFlow     | /api/flow     |
| LegalEvents   | /api/events   |
