![LTO github readme](https://user-images.githubusercontent.com/100821/196711741-96cd4ba5-932a-4e95-b420-42d4d61c21fd.png)

# LTO Network Identity Node

## Configuration

You can configure environment variables for docker compose.

#### Public Node

| variable name     | description                                                                                     | format               | extra information                                                             |
| ----------------- | ----------------------------------------------------------------------------------------------- | -------------------- | ----------------------------------------------------------------------------- |
| `LTO_API_KEY`     | API key to protect restricted functions (random secret)                                         | string               | This can be any string                                                        |
| `LTO_NETWORK`     | Which network to attach the node to                                                             | `MAINNET`, `TESTNET` | Default is set to `MAINNET`                                                   |
| `LTO_WALLET_SEED` | The seed of your wallet. Your wallet needs to have sufficient funds to anchor the transactions. | string               | Can also be set as `LTO_WALLET_SEED_BASE58`, which will take a `base58` value |
| `LTO_NODE_NAME`        | Node name used in the handshake when connecting to other nodes                                  | string                 |

#### Indexer

| variable name  | description                                             | format | extra information                                                    |
| -------------- | ------------------------------------------------------- | ------ | -------------------------------------------------------------------- |
| `NODE_API_KEY` | API key to protect restricted functions (random secret) | string | Make sure to match the same value as the _Public Node_ configuration |

**Note**

The indexer is configured to run as an identity service, but you can customize to your liking. You can see the [GitHub page](https://github.com/ltonetwork/indexer#configuration) for more on how to configure the indexer.

### Trust Network

In addition to environment variables, you can also specifigy configuration options using the config file. This is especially useful when configuring a trust network.

By default, only the network root, which is your node address, is registered. Add additional roles and specify how those roles are granted.

```json
{
  "trust_network": {
    "root": {
      "description": "LTO account of our identity node"
      "issues": [
         { "type": 1, "role": "trusted" }
      ]
    },
    "trusted": {
       "description": "Trusted party"
    }
  }
}
```

You can read more about the trust network [here](https://docs.ltonetwork.com/v/edge/node/identity-node/configuration-1/configuration).

### Docker images

By default, the `latest` tag is used for all docker images. You can use an alternative tag for the LTO public node by setting `LTO_NODE_VERSION` and `LTO_INDEXER_VERSION` for the LTO indexer.

## Redis

Data is stored on-disk using LevelDB. You can store the data using Redis. Use the `redis` profile to start a Redis Graph instance and set the storage type variable:

```
export STORAGE_TYPE=redis
docker compose --profile redis up
```

Alternatively, you can run a Redis instance outside of the docker compose cluster and connect to that with the `REDIS_URL` environment variable. Redis Graph is needed to index associations as a graph.

## Run on a (virtual) machine

```
docker-compose up
```
    
Docker compose is configured to run the node on a local machine on port 80. You can set the `PORT` environment` variable to use a different port.

## Cloudformation

Use `lto-identity-node.ecs.yaml` to run the index node using AWS Cloudformation.

## Running a node

### Testnet
 
If you wish to start testing with our testnet. Please create a wallet on: [https://wallet.testnet.lto.network](https://wallet.testnet.lto.network)
 
Request testnet tokens via the [LTO Tech Lab](https://t.me/ltotech) Telegram group.
 
To view all the transactions on the testnet you can check out our explorer on: [https://explorer.testnet.lto.network](https://explorer.testnet.lto.network)
 
### Mainnet
 
For mainnet you will have to buy tokens. You can then use these tokens by sending them to the wallet you will link to your node.
 
The wallet can be found here: [https://wallet.lto.network](https://wallet.lto.network)
 
The explorer can be found here: [https://explorer.lto.network](https://explorer.lto.network)
