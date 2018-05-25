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
    
Docker compose is configured to run the node on a local machine. If you are running the node a hosted machine and it needs
to be accessible over to internet you will have to change the port mapping in the `docker-compose.yml` to

    ports:
        - "80:3000"

This way the node will be accessible via port 80.

Or you can use a reverse proxy like NGINX to make the node publicly available. This is highly recommended. 

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
