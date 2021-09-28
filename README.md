![github-banner](https://user-images.githubusercontent.com/100821/108692834-6a115200-74fd-11eb-92df-ee07bf62b386.png)

# Public Index Node

NGINX setup for LTO [public node](https://github.com/ltonetwork/lto-public-chain) + [indexer](https://github.com/ltonetwork/indexer)

## Configuration

Under the `Dockerrun.json` files, you can configure environment variables for the containers. If you want the `indexer` to run with all the functionalities, be sure to provide the following variables:

| variable name           | description                                      | format                 | default value | extra information                                         |
| ----------------------- | ------------------------------------------------ | ---------------------- | ------------- | --------------------------------------------------------- |
| `ASSOCIATION_INDEXING`  | Indexing of association transactions             | `none`, `trust`, `all` | `"none"`      |                                                           |
| `ASSOCIATION_USE_GRAPH` | Whether to use Redis Graph to store associations | boolean                | `false`       | Requires `redis_graph` to be set                          |
| `IDENTITY_INDEXING`     | Indexing of identities                           | boolean                | `false`       | Tracks verification methods and public keys for addresses |
| `TRANSACTION_INDEXING`  | Indexing of transactions                         | boolean                | `false`       |                                                           |
| `ANCHOR_INDEXING`       | Indexing of anchor transactions                  | `none`, `trust`, `all` | `"none"`      |                                                           |
| `STATS_INDEXING`        | Indexing of blockchain statistics                | boolean                | `false`       | Enables `operations`, `transactions` and `supply` stats   |

The indexing configurations have the values of `none`, `trust` or `all`.

- `none`: no transactions will be indexed
- `trust`: only transactions from someone in your configured trust network will be indexed (see [configuring a trust network](https://docs.ltonetwork.com/v/edge/identity-node/configuration-1/configuration))
- `all`: all transactions will be indexed

You can see a list of all of the available variables on the [indexer](https://github.com/ltonetwork/indexer) repository.
