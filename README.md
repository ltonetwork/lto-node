![LTO github readme](https://user-images.githubusercontent.com/100821/211341590-36d70b2c-2d80-4759-ab40-727f8c3c3091.png)

# Public Index Node

NGINX setup for LTO [public node](https://github.com/ltonetwork/lto-public-chain) + [indexer](https://github.com/ltonetwork/indexer)

## Memory

It is recommended to have at least 2gb of RAM to run this configuration, as the public node alone is configured for 1024mb. Lower memory allocation could result in the node becoming unresponsive.

## Configuration

Under the `docker-compose.yml` files, you can configure environment variables for the containers. If you want the `indexer` to run with all the functionalities, be sure to provide the following variables:

| variable name          | description                          | format                 | desired value | extra information                                         |
| ---------------------- | ------------------------------------ | ---------------------- | ------------- | --------------------------------------------------------- |
| `ASSOCIATION_INDEXING` | Indexing of association transactions | `none`, `trust`, `all` | `"all"`       |                                                           |
| `IDENTITY_INDEXING`    | Indexing of identities               | boolean                | `true `       | Tracks verification methods and public keys for addresses |
| `TRANSACTION_INDEXING` | Indexing of transactions             | boolean                | `true `       |                                                           |
| `ANCHOR_INDEXING`      | Indexing of anchor transactions      | `none`, `trust`, `all` | `"all" `      |                                                           |
| `STATS_INDEXING`       | Indexing of blockchain statistics    | boolean                | `true `       | Enables `operations`, `transactions` and `supply` stats   |

You can see a list of all of the available variables on the [indexer](https://github.com/ltonetwork/indexer) repository.

## Cloudformation

Use `lto-index-node.ecs.yaml` to run the index node using AWS Cloudformation.

