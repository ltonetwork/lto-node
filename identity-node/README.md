![LTO github readme](https://user-images.githubusercontent.com/100821/196711741-96cd4ba5-932a-4e95-b420-42d4d61c21fd.png)

# LTO Network Identity Node

## Configuration

The configuration can be done via the `./docker-compose.yml` file.

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

The docker configuration comes with Redis included. It is adviced to run these services outside of the node. The following Environment properties can be used to connect to external services:

| Service                 | Variable                     | Description                                                                         |
| ----------------------- | ---------------------------- | ----------------------------------------------------------------------------------- |
| Indexer                 | `REDIS_URL`                  | See the [GitHub page](https://github.com/ltonetwork/indexer#configuration) for more |

## Run on a (virtual) machine

```
docker-compose up
```

Docker compose is configured to run the indexer on a local machine on port 80. If you would like to run it on different
port you will need to change the `docker-compose.yml` to

```
ports:
    - <your-port>:80
```

This way the node will be accessible via port 80.

Or you can use a reverse proxy like NGINX to both the node and indexer run off the same port or publicly available. This is highly recommended.

## Documentation

You can find the API documentation on the url where your node is deployed.

## Running a node

### TestNet
 
If you wish to start testing with our testnet. Please create a wallet on: [https://wallet.testnet.lto.network](https://wallet.testnet.lto.network)
 
Request testnet tokens via the [LTO Tech Lab](https://t.me/ltotech) Telegram group.
 
To view all the transactions on the testnet you can check out our explorer on: [https://explorer.testnet.lto.network](https://explorer.testnet.lto.network)
 
### Mainnet
 
For mainnet you will have to buy tokens. You can then use these tokens by sending them to the wallet you will link to your node.
 
The wallet can be found here: [https://wallet.lto.network](https://wallet.lto.network)
 
The explorer can be found here: [https://explorer.lto.network](https://explorer.lto.network)
