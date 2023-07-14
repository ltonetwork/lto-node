![LTO github readme](https://user-images.githubusercontent.com/100821/211341590-36d70b2c-2d80-4759-ab40-727f8c3c3091.png)

# Public Index Node

NGINX setup for LTO [public node](https://github.com/ltonetwork/lto-public-chain) + [indexer](https://github.com/ltonetwork/indexer)

## Memory

It is recommended to have at least 2gb of RAM to run this configuration, as the public node alone is configured for 1024mb. Lower memory allocation could result in the node becoming unresponsive.

## Configuration

You can configure environment variables for docker compose. The `indexer` is configured with the following variables:

| variable name          | description                          | format                 | devault value | extra information                                         |
| ---------------------- | ------------------------------------ | ---------------------- | ------------- | --------------------------------------------------------- |
| `LTO_NETWORK`          | Mainnet or testnet                   | `MAINNET`, `TESTNET`   | `MAINNET`     |                                                           | 
| `ASSOCIATION_INDEXING` | Indexing of association transactions | `none`, `trust`, `all` | `"all"`       |                                                           |
| `IDENTITY_INDEXING`    | Indexing of identities               | boolean                | `true`        | Tracks verification methods and public keys for addresses |
| `TRANSACTION_INDEXING` | Indexing of transactions             | boolean                | `true`        |                                                           |
| `ANCHOR_INDEXING`      | Indexing of anchor transactions      | `none`, `trust`, `all` | `"all"`       |                                                           |
| `STATS_INDEXING`       | Indexing of blockchain statistics    | boolean                | `true`        | Enables `operations`, `transactions` and `supply` stats   |

You can see a list of all of the available variables on the [indexer](https://github.com/ltonetwork/indexer) and the [public chain](https://github.com/ltonetwork/lto-public-chain) repositories.

### Docker images

By default, the `latest` tag is used for all docker images. You can use an alternative tag for the LTO public node by setting `LTO_NODE_VERSION` and `LTO_INDEXER_VERSION` for the LTO indexer.

## Redis

Data is stored on-disk using LevelDB. You can store the data using Redis. Use the `redis` profile to start a Redis Graph instance and set the storage type variable:

```
export STORAGE_TYPE=redis
docker compose --profile redis up
```

Alternatively, you can run a Redis instance outside of the docker compose cluster and connect to that with the `REDIS_URL` environment variable. Redis Graph is needed to index associations as a graph.

## Cloudformation

Use `lto-index-node.ecs.yaml` to run the index node using AWS Cloudformation.

