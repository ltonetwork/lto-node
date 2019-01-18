# LTO Network Node


## Requirements

- [Docker](https://www.docker.com/)
- [Docker compose >= v3.0](https://docs.docker.com/compose/)

_You can optain the latest version of `docker-compose` using pip._


## System requirements

**The Minimal requirements are:**

1 vCPU
4Gb RAM
30Gb SSD

**Recommended configuration are:**

2+ vCPU
8Gb RAM
+30Gb SSD

## Installation

This repository contains the configuration files to run your LTO Node. There are 3 configuration variations of the node.
Each configuration serves a different need of the node:

Node Type                          |Description
-----------------------------------|-----------
[Public Node only](public-node)    | Contains only the public node. This configuration can be used for mining 
[Anchor Node](anchor-node)         | Contains both the public node and the anchoring service. This configuration can be used for the anchoring of hashes of the public LTO chain 
[Full Node](full-node)             | Contains all services. This configuration can used to run decentralized workflows

 ### TestNet
 
 If you wish to start testing with our testnet. Please create a wallet on: [https://testnet-wallet.lto.network](https://testnet-wallet.lto.network)
 
 Send you address to our [support](mailto:support@legalthings.io) so we will deposit some LTO for testing on the testnet. Or request your tokens via our [telegram](https://t.me/joinchat/AJWQTUDKtDlsuGHVFb40eQ) channel.
 
 To view all the transactions on the testnet you can check out our explorer on: [https://testnet-explorer.lto.network](https://testnet-explorer.lto.network)
 
 ### Mainnet
 
 For mainnet you will have to buy tokens. You can then use these tokens and send them to the wallet you will link to your node
 or lease then to the wallet linked to your node.
 
 The wallet can be found here: [https://wallet.lto.network](https://wallet.lto.network)
 
 The explorer can be found here: [https://explorer.lto.network](https://explorer.lto.network)