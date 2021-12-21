![LTO Network](https://user-images.githubusercontent.com/100821/108692834-6a115200-74fd-11eb-92df-ee07bf62b386.png)

There are 4 configuration variations of the node. Each configuration serves a different need of the node:

| Node Type          | Description                                                                                                   |
| ------------------ | ------------------------------------------------------------------------------------------------------------- |
| [Public Node only] | Contains only the public node. This configuration can be used for mining                                      |
| [Anchor Node]      | Contains both the public node and the indexer. The indexer is configured for the anchoring of hashes          |
| **Identity Node**  | Contains both the public node and the indexer. The indexer is configured for DID documents and trust networks |
| [Full Node]        | Contains all services. This configuration can used to run decentralized workflows                             |

[public node only]: https://github.com/ltonetwork/lto-public-node
[anchor node]: https://github.com/ltonetwork/lto-anchor-node
[full node]: https://github.com/ltonetwork/lto-full-node

# LTO Network Identity Node

## Configuration

The configuration can be done via the `./docker-compose.yml` file.

### Volumes

By default, the volumes for the containers are each mounted under `./volumes/`. You can change this for each service to mount to a different folder on your device. Example:

```yml
public-node:
  container_name: public-node
  image: ltonetwork/public-node
  volumes:
    - /<YOUR-FOLDER-HERE>/public-node:/lto
  environment:
    - LTO_NETWORK=TESTNET
  networks:
    - lto
```

### Required fields

There are different required fields, they are mentioned per service:

_Public Node_

| variable name     | description                                                                                     | format               | extra information                                                             |
| ----------------- | ----------------------------------------------------------------------------------------------- | -------------------- | ----------------------------------------------------------------------------- |
| `LTO_API_KEY`     | API key to protect restricted functions (random secret)                                         | string               | This can be any string                                                        |
| `LTO_NETWORK`     | Which network to attach the node to                                                             | `MAINNET`, `TESTNET` | Default is set to `TESTNET`                                                   |
| `LTO_WALLET_SEED` | The seed of your wallet. Your wallet needs to have sufficient funds to anchor the transactions. | string               | Can also be set as `LTO_WALLET_SEED_BASE58`, which will take a `base58` value |

_Indexer_

| variable name  | description                                             | format | extra information                                                    |
| -------------- | ------------------------------------------------------- | ------ | -------------------------------------------------------------------- |
| `NODE_API_KEY` | API key to protect restricted functions (random secret) | string | Make sure to match the same value as the _Public Node_ configuration |

**Note**

The indexer is configured to run as an identity service, but you can customize to your liking. You can see the [GitHub page](https://github.com/ltonetwork/indexer#configuration) for more on how to configure the indexer.

### Trust Network

The trust network configuration is done via the following variables:

| variable name            | description                                                                | format  | extra information                                                                                                                                             |
| ------------------------ | -------------------------------------------------------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `TRUST_NETWORK_INDEXING` | Flag that allows the service to index trust network roles and transactions | boolean | Needs to be set to `true` if you want to run a trust network                                                                                                  |
| `TRUST_NETWORK_ROLES`    | The roles for the trust network, in a JSON format                          | object  | As this variable is an object, it needs to be encased in single quotes `'` to work. For the `Dockerrun` files, you need to escape the double quotes with `\"` |

By default, this node comes with an example for trust network configuration, which you can find on the file `trust-network-example.json`. You can modify this file to your liking, but don't forget to copy the contents into the `TRUST_NETWORK_ROLES` in the `docker-compose` file.

You can read more about the trust network [here](https://docs.ltonetwork.com/v/edge/node/identity-node/configuration-1/configuration).

### Connecting to External Services

The node configuration comes with Redis, RabbitMQ and MongoDB included. It is adviced to run these services outside of
the node. The following Environment properties can be used to connect to external services:

| Service                 | Variable                     | Description                                                                         |
| ----------------------- | ---------------------------- | ----------------------------------------------------------------------------------- |
| LegalEvents / Legalflow | `MONGODB_URL`                | Use the MongoDB connection string                                                   |
| Event Dispatcher        | `DISPATCHER_RABBITMQ_CLIENT` | Use the RabbitMQ connection string                                                  |
| Webserver               | `PORT`                       | Run the node on a different port                                                    |
| Indexer                 | `REDIS_URL`                  | See the [GitHub page](https://github.com/ltonetwork/indexer#configuration) for more |

## Run on a (virtual) machine

```
docker-compose up
```

Docker compose is configured to run the node on a local machine on port 80. If you would like to run the node on different
port you will need to change the `docker-compose.yml` to

```
ports:
    - <your-port>:80
```

This way the node will be accessible via port 80.

Or you can use a reverse proxy like NGINX to make the node publicly available. This is highly recommended.

## Run in AWS Elastic Beanstalk

Running the node using AWS Elastic Beanstalk (EB) will install the services on a cloud machine. This node includes a
Redis database, however it is highly recommended to use AWS Elastic Cache. The are 2 EB configuration files included.

1. Dockerrun.redis.aws.json
2. Dockerrun.leveldb.aws.json

Take the following steps to install the node on EB:

1. Choose if you wish to run the node with or without redis. Rename the correct config file to Dockerrun.aws.json
2. Zip the Dockerrun.aws.json file
3. Create an application
4. Inside the created application, create an environment: `webserver environment`
5. Select following settings:

- Platform: Multi-container Docker
- Upload the zipped file

6. Configure more options
7. Instances -> Instance type: Choose an instance with atleast 2 gb of memory (E.g. t2.small)
8. Software -> Environment properties:
   - Name: `LTO_NETWORK`, Value: `MAINNET` or `TESTNET` - the default is `MAINNET`, but you can set it to run a node on testnet if you wish
   - Name: `LTO_API_KEY`, Value: `Any string` - this is your API key, can be any random string you wish
   - Name: `NODE_API_KEY`, Value: `Same as LTO_API_KEY` - this is the API key for the `indexer` service, should be the same as `LTO_API_KEY`
   - Name: `LTO_WALLET_PASSWORD`, Value: `Your wallet password`
   - Name: `LTO_WALLET_SEED` or `LTO_WALLET_SEED_BASE58`, Value: `Wallet Seed`
   - Name: `PUBLIC_HOSTNAME`, Value: `The hostname where the node is reachable. (This can be EB generated address)`

Now your node is should good to go!

## Documentation

You can find the API documentation on the url where your node is deployed.

## Running a node

### TestNet

If you wish to start testing with our testnet. Please create a wallet on: [https://testnet-wallet.lto.network](https://testnet-wallet.lto.network)

Send you address to our [support](mailto:support@ltonetwork.io) so we will deposit some LTO for testing on the testnet. Or request your tokens via our [telegram](https://t.me/joinchat/AJWQTUDKtDlsuGHVFb40eQ) channel.

To view all the transactions on the testnet you can check out our explorer on: [https://testnet-explorer.lto.network](https://testnet-explorer.lto.network)

### Mainnet

For mainnet you will have to buy tokens. You can then use these tokens by sending them to the wallet you will link to your node.

The wallet can be found here: [https://wallet.lto.network](https://wallet.lto.network)

The explorer can be found here: [https://explorer.lto.network](https://explorer.lto.network)
