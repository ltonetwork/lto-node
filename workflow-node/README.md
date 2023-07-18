![LTO github readme](https://user-images.githubusercontent.com/100821/196711741-96cd4ba5-932a-4e95-b420-42d4d61c21fd.png)

# LTO Network Workflow Node

## Requirements

- [Docker](https://www.docker.com/)
- [Docker compose >= v3.0](https://docs.docker.com/compose/)

_You can optain the latest version of `docker-compose` using pip._

Alternatively 

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

The configuration can be done via the `./docker-compose.yml` file.

#### Volumes

By default, the volumes for the containers are each mounted under `./volumes/`. You can change this for each service to mount to a different folder on your device. Example:

```yml
  public-node:
    container_name: public-node
    image: ltonetwork/public-node
    mem_limit: 1g
    volumes:
      - /<YOUR-FOLDER-HERE>/public-node:/lto
    environment:
      - LTO_NETWORK=TESTNET
    networks:
      - lto
```

#### Required fields

There are different required fields, they are mentioned per service:

*Public Node*

| variable name          | description                                                                                      | format                 | extra information                                                             |
| ---------------------- | ------------------------------------------------------------------------------------------------ | ---------------------- | ----------------------------------------------------------------------------- |
| `LTO_API_KEY`          | API key  to protect restricted functions (random secret)                                         | string                 | This can be any string                                                        |
| `LTO_NETWORK`          | Which network to attach the node to                                                              | `MAINNET`, `TESTNET`   | Default is set to `MAINNET`                                                   |
| `LTO_WALLET_SEED`      | The seed of your wallet. Your wallet needs to have sufficient funds to anchor the transactions.  | string                 | Can also be set as `LTO_WALLET_SEED_BASE58`, which will take a `base58` value |

*Indexer*

| variable name          | description                                                                                      | format                 | extra information                                                             |
| ---------------------- | ------------------------------------------------------------------------------------------------ | ---------------------- | ----------------------------------------------------------------------------- |
| `NODE_API_KEY`         | API key  to protect restricted functions (random secret)                                         | string                 | Make sure to match the same value as the *Public Node* configuration          |

**Note**

The indexer is already configured to track all of the available options, but you can customize to your liking. You can see the [GitHub page](https://github.com/ltonetwork/indexer#configuration) for more on how to configure the indexer.

#### Connecting to External Services

The node configuration comes with Redis, RabbitMQ and MongoDB included. It is adviced to run these services outside of 
the node. The following Environment properties can be used to connect to external services:

| Service                   | Variable                      | Description                                                                         |
| ------------------------- | ------------------------------| ----------------------------------------------------------------------------------- |
| LegalEvents / Legalflow   | `MONGODB_URL`                 | Use the MongoDB connection string                                                   |
| Event Dispatcher          | `DISPATCHER_RABBITMQ_CLIENT`  | Use the RabbitMQ connection string                                                  |
| Webserver                 | `PORT`                        | Run the node on a different port                                                    |
| Indexer                   | `REDIS_URL`                   | See the [GitHub page](https://github.com/ltonetwork/indexer#configuration) for more |

## Running a node

### Testnet
 
If you wish to start testing with our testnet. Please create a wallet on: [https://wallet.testnet.lto.network](https://wallet.testnet.lto.network)
 
Request testnet tokens via the [LTO Tech Lab](https://t.me/ltotech) Telegram group.
 
To view all the transactions on the testnet you can check out our explorer on: [https://explorer.testnet.lto.network](https://explorer.testnet.lto.network)
 
### Mainnet
 
For mainnet you will have to buy tokens. You can then use these tokens by sending them to the wallet you will link to your node.
 
The wallet can be found here: [https://wallet.lto.network](https://wallet.lto.network)
 
The explorer can be found here: [https://explorer.lto.network](https://explorer.lto.network)
