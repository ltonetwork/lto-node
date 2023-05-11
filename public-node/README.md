![LTO github readme](https://user-images.githubusercontent.com/100821/196711741-96cd4ba5-932a-4e95-b420-42d4d61c21fd.png)

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
