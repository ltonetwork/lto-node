# LTO Network Full Node

## Run in AWS Elastic Beanstalk

Running the node using AWS Elastic Beanstalk (EB) it will only install the services on a machine. 

Take to following steps to install the node on EB:

1. Choose if you wish to run the node with or without redis. Rename the correct config file to Dockerrun.aws.json
2. Zip the Dockerrun.aws.json file
3. Create an application
4. Inside the created application, create an environment: `webserver environment`
5. Select following settings:
  - Platform: Multi-container Docker
  - Upload the zipped file
6. Configure more options
7. Instances -> Instance type: Choose an instance with atleast 2 gb of memory (E.g. t2.small)
6. Software -> Environment properties:
    - Name: `LTO_NETWORK`, Value: `MAINNET` or `TESTNET` - the default is `MAINNET`, but you can set it to run a node on testnet if you wish
    - Name: `LTO_API_KEY`, Value: `Any string` - this is your API key, can be any random string you wish
    - Name: `NODE_API_KEY`, Value: `Same as LTO_API_KEY` - this is the API key for the `indexer` service, should be the same as `LTO_API_KEY`
    - Name: `LTO_WALLET_PASSWORD`, Value: `Your wallet password`
    - Name: `LTO_WALLET_SEED` or `LTO_WALLET_SEED_BASE58`, Value: `Wallet Seed`
    - Name: `PUBLIC_HOSTNAME`, Value: `The hostname where the node is reachable. (This can be EB generated address)`

##### Connecting to External Services

The node configuration comes with Redis, RabbitMQ and MongoDB included. It is adviced to run these services outside of 
the node. The following Environment properties can be used to connect to external services:

| Service                   | Variable                    | Description                                                                         |
| ------------------------- | ----------------------------| ----------------------------------------------------------------------------------- |
| LegalEvents / Legalflow   | `MONGODB_URL`                 | Use the MongoDB connection string                                                   |
| Event Dispatcher          | `DISPATCHER_RABBITMQ_CLIENT`  | Use the RabbitMQ connection string                                                  |
| Webserver                 | `PORT`                        | Run the node on a different port                                                    |
| Indexer                   | `REDIS_URL`                   | See the [GitHub page](https://github.com/ltonetwork/indexer#configuration) for more |
