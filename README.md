![LTO Network](https://user-images.githubusercontent.com/100821/108692834-6a115200-74fd-11eb-92df-ee07bf62b386.png)

There are 4 configuration variations of the node. Each configuration serves a different need of the node:

Node Type             |Description
----------------------|-----------
**Public Node only**  |Contains only the public node. This configuration can be used for mining 
[Anchor Node]         |Contains both the public node and the indexer. The indexer is configured for the anchoring of hashes
[Identity Node]       |Contains both the public node and the indexer. The indexer is configured for DID documents and trust networks
[Full Node]           |Contains all services. This configuration can used to run decentralized workflows

[Anchor Node]: https://github.com/ltonetwork/lto-anchor-node
[Identity Node]: https://github.com/ltonetwork/lto-identity-node
[Full Node]: https://github.com/ltonetwork/lto-full-node

# LTO Network Public Node

## Configuration

The configuration can be done via the `./docker-compose.yml` file.

### Volumes

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

### Required fields

There are different required fields, they are mentioned per service:

*Public Node*

| variable name          | description                                                                                     | format                 | extra information                                                             |
| ---------------------- | ----------------------------------------------------------------------------------------------- | ---------------------- | ----------------------------------------------------------------------------- |
| `LTO_API_KEY`          | API key to protect restricted functions (random secret)                                         | string                 | This can be any string                                                        |
| `LTO_NETWORK`          | Which network to attach the node to                                                             | `MAINNET`, `TESTNET`   | Default is set to `TESTNET`                                                   |
| `LTO_WALLET_SEED`      | The seed of your wallet. Your wallet needs to have sufficient funds to anchor the transactions. | string                 | Can also be set as `LTO_WALLET_SEED_BASE58`, which will take a `base58` value |

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

Running the node using AWS Elastic Beanstalk (EB) will install the services on a cloud machine.

Take the following steps to install the node on EB:

1. Zip the Dockerrun.aws.json file
2. Create an application
3. Inside the created application, create an environment: `webserver environment`
4. Select following settings:
  - Platform: Multi-container Docker
  - Upload the zipped file
5. Configure more options
6. Instances -> Instance type: Choose an instance with atleast 2 gb of memory (E.g. t2.small)
7. Software -> Environment properties:
    - Name: `LTO_NETWORK`, Value: `MAINNET` or `TESTNET` - the default is `MAINNET`, but you can set it to run a node on testnet if you wish
    - Name: `LTO_API_KEY`, Value: `Any string` - this is your API key, can be any random string you wish
    - Name: `LTO_WALLET_PASSWORD`, Value: `Your wallet password`
    - Name: `LTO_WALLET_SEED` or `LTO_WALLET_SEED_BASE58`, Value: `Wallet Seed`
    - Name: `PUBLIC_HOSTNAME`, Value: `The hostname where the node is reachable. (This can be EB generated address)`

Now your node is good to go!

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
