#LTO Network Full Node

##Requirements

- [Docker](https://www.docker.com/)
- [Docker compose >= v3.0](https://docs.docker.com/compose/)

_You can optain the latest version of `docker-compose` using pip._

##Run on a (virtual) machine

### System requirements

**The Minimal requirements are:**

1 vCPU
2Gb RAM
30Gb SSD

**Recommended configuration are:**

2+ vCPU
4Gb RAM
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

##### Optional fields

There a several settings that you can change within the node.

*Database*

The Node uses `Mongo` en `Redis` database systems. If you already have a Mongo or Redis solution it's possible to connect 
the node to your existing solutions. 

**Mongo**

If you wish to use your existing mongo solution you need to add the following environment variable:

`MONGO_DB=<mongo connection string>` to the following services: `legalflow` and `legalevents`.

**Redis** 

If you whish to use you existing redis solution you need to add the following environment variable:

`ANCHOR_DB_URL=<redis connection string>` to the following service `anchor`. 

*Port*

Docker compose is configured to run the node on a local machine on port 80. If you would like to run the node on different
port you will need to change the `docker-compose.yml` to

    ports:
        - "<your-port>:80"

This way the node will be accessible via port 80.

Or you can use a reverse proxy like NGINX to make the node publicly available. This is highly recommended. 

### Running

Running the Node is done with the following command

    docker-compose up
    
