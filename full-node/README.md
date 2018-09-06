LegalThings Full One Node
===

Requirements
---

- [Docker](https://www.docker.com/)
- [Docker compose >= v3.0](https://docs.docker.com/compose/)

_You can optain the latest version of `docker-compose` using pip._

Run on a (virtual) machine
---

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
-  `LTO_API_KEY`: This is to set an api key to protect restricted api functions. (Random secret)
- `LTO_WALLET_SEED`: This is the seed of your wallet. Your wallet needs to have sufficient funds to anchor the transactions.

or

- `LTO_WALLET_SEED_BASE58`: This is base58 version of your wallet seed.

##### Optional fields

The optional fields will also be discussed per service:

*Webserver*

Docker compose is configured to run the node on a local machine on port 80. If you would like to run the node on different
port you will need to change the `docker-compose.yml` to

    ports:
        - "<your-port>:3000"

This way the node will be accessible via port 80.

Or you can use a reverse proxy like NGINX to make the node publicly available. This is highly recommended. 

### Running

Running the Node is done with the following command

    docker-compose up
    
