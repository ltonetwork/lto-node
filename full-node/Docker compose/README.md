# LTO Network Full Node

## Requirements

- [Docker](https://www.docker.com/)
- [Docker compose >= v3.0](https://docs.docker.com/compose/)

_You can optain the latest version of `docker-compose` using pip._

## Run on a (virtual) machine

### System requirements

**The Minimal requirements are:**

1 vCPU
4Gb RAM
30Gb SSD

**Recommended configuration are:**

2+ vCPU
8Gb RAM
+30Gb SSD


### Configuration

The are a fields in the `docker-compose.yml` which are required to fill and there are several which are optional. 

##### Required fields

There are different required fields, they are mentioned per service:

*Anchor*
- `LTO_API_KEY`: This is used to connect to the `Public Node`. (Random secret)

*Public Node*
- `LTO_API_KEY`: This is to set an api key to protect restricted api functions. (Random secret)
- `LTO_WALLET_SEED`: This is the seed of your wallet. Your wallet needs to have sufficient funds to anchor the transactions.

or

- `LTO_WALLET_SEED_BASE58`: This is base58 version of your wallet seed.

### Other configuration options

The node configuration comes with Redis, RabbitMQ and MongoDB included. It is adviced to run these services outside of 
the node. The following Environment properties can be used to connect to external services:

Service                   | Variable                    | Description                           
------------------------- | ----------------------------| ------------------------------------- 
LegelEvents / Legalflow   | MONGODB_URL                 | Use the MongoDB connection string     
Anchor                    | ANCHOR_REDIS_URL            | Use the redis connection string       
Event Dispatcher          | DISPATCHER_RABBITMQ_CLIENT  | Use the RabbitMQ connection string     
Webserver                 | PORT                        | Run the node on a different port        

### Running

Running the Node is done with the following command

    docker-compose up