# Lisa Studio

With most NFT platforms on the market today, creator's don't actually own the smart contract they are minting their NFTs on. If you just upload pngs to opensea, opensea retains admin privelidge of that smart contract. In an ideal world, creators would have complete control over their own NFTs, and their own smart contracts.

This is an early MVP, weekend hack project, to build out a Factory smart contract, that deploys other proxy ERC721 contracts. In theory this could be built out into a live product allowing creators to launch their own contracts. 

Similar to https://www.manifold.xyz/

These Contracts are unauditied, so proceed with caution. The frontend has been deployed with Next.js on the Rinkeby network.

The factory contract is deployed at:
Rinkeby: 0x3Ea0DEe50A3e6Cd61F05526164513319A0766E93

To use the project:
```shell
git clone
npx hardhat init
npx hardhat run scripts/deploy.js --network rinkeby
```

The core concept for the idea, and rough framework for the smart contracts was heavilty inspired by the work of Ian Nash at Zora, and their editions contract. 

https://github.com/ourzora/nft-editions

Throughout this build, I referenced:
- https://hardhat.org/tutorial/deploying-to-a-live-network.html
- https://docs.alchemy.com/alchemy/tutorials/how-to-create-an-nft
