# LTO Network

There are 3 configuration variations of the node. Each configuration serves a different need of the node:

Node Type             |Description
----------------------|-----------
[Public Node only]    |Contains only the public node. This configuration can be used for mining 
**Anchor Node**       |Contains both the public node and the anchoring service. This configuration can be used for the anchoring of hashes of the public LTO chain 
[Full Node]           |Contains all services. This configuration can used to run decentralized workflows

[Public Node only]: https://github.com/ltonetwork/lto-public-node
[Full Node]: https://github.com/ltonetwork/lto-full-node

# LTO Network Anchor Node

## Configuration

Before you run the node you will need to configure a few environment variables per service:

**Public Node Container**
1. LTO_WALLET_SEED: The seed of your wallet. Your account will need at least 1000 LTO to be able to start mining.
2. LTO_WALLET_SEED_BASE58: The seed of your wallet but then base58 encoded. This will overwrite the LTO_WALLET_SEED
3. LTO_WALLET_PASSWORD: This password is used to encrypt your seed on disk.
4. LTO_API_KEY: Choose an api-key this need to be same in the `Anchor service` so that is able to communicate with the public node.
5. LTO_NETWORK: Choose the network you want to connect your node to. The options are: `MAINNET` and `TESTNET` (default is`MAINNET`).

For other options check out: [Public Node on Github](https://github.com/legalthings/docker-public-node)

**Anchor service**
1. LTO_API_KEY: The same ApiKey as was set in the `Public Node`. 
2. STORAGE_TYPE: Select how the index should be stored. OOptions are `redis` and `leveldb` (default).

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
Running the node using AWS Elastic Beanstalk (EB) it will only install the services on a machine. This node includes a
Redis database, however it is highly recommended to use AWS Elastic Cache. The are 3 EB configuration files included. 

1. Dockerrun.elastic-cache.aws.json
2. Dockerrun.redis.aws.json
3. Dockerrun.leveldb.aws.json

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
    - Name: `LTO_WALLET_PASSWORD`, Value: `Your wallet password`
    - Name: `LTO_WALLET_SEED` or `LTO_WALLET_SEED_BASE58`, Value: `Wallet Seed`
    - Name: `ANCHOR_REDIS_URL`, Value: `"<Your redis connection string>"` (If you are running with elastic cache)

Now your node is should good to go!

## Documentation

You can find the API documentation on the url where your node is deployed.

## Running a node

### TestNet
 
If you wish to start testing with our testnet. Please create a wallet on: [https://testnet-wallet.lto.network](https://testnet-wallet.lto.network)
 
Send you address to our [support](mailto:support@legalthings.io) so we will deposit some LTO for testing on the testnet. Or request your tokens via our [telegram](https://t.me/joinchat/AJWQTUDKtDlsuGHVFb40eQ) channel.
 
To view all the transactions on the testnet you can check out our explorer on: [https://testnet-explorer.lto.network](https://testnet-explorer.lto.network)
 
### Mainnet
 
For mainnet you will have to buy tokens. You can then use these tokens by sending them to the wallet you will link to your node.
 
The wallet can be found here: [https://wallet.lto.network](https://wallet.lto.network)
 
The explorer can be found here: [https://explorer.lto.network](https://explorer.lto.network)

