# LTO Network Public Node

## Configuration

Before you run the node you will need to configure a few environment variables per service:

**Public Node**
1. LTO_WALLET_SEED: The seed of your wallet. Your account will need at least 1000 LTO to be able to start mining.
2. LTO_WALLET_SEED_BASE58: The seed of your wallet but then base58 encoded. This will overwrite the LTO_WALLET_SEED
3. LTO_WALLET_PASSWORD: This password is used to encrypt your seed on disk.
4. LTO_API_KEY: Choose an api-key to be able to perform certain actions in the GUI.


## Run on a (virtual) machine

```
docker-compose up
```
    
Docker compose is configured to run the node on a local machine on port 80. If you would like to run the node on different
port you will need to change the `docker-compose.yml` to

```
ports:
    - <your-port>:6869
```

This way the node will be accessible via port 80.

Or you can use a reverse proxy like NGINX to make the node publicly available. This is highly recommended. 

## Run in AWS Elastic Beanstalk

Take to following steps to install the node on EB:

1. Zip the Dockerrun.aws.json file
2. Create an application
3. Inside the created application, create an environment: `webserver environment`
4. Select following settings:
  - Platform: Docker
  - Upload the zipped file
5. Configure more options
6. Instances -> Instance type: Choose an instance with atleast 2 gb of memory (E.g. t2.small)
7. Software -> Environment properties:
    - Name: `LTO_WALLET_PASSWORD`, Value: `Your wallet password`
    - Name: `LTO_WALLET_SEED` or `LTO_WALLET_SEED_BASE58`, Value: `Wallet Seed`

Now your node is should good to go!

## Documentation

You can find the API documentation on the url where your node is deployed.

## Explorer

View your transactions in our explorer testnet: [testnet-explorer.lto.network](https://testnet-explorer.lto.network)