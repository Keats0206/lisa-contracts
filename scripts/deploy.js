// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);
  console.log("Account balance:", (await deployer.getBalance()).toString());

  const CreatorContract = await ethers.getContractFactory("CreatorContract");
  const creatorContract = await CreatorContract.deploy();
  console.log("Creator Contract Address:", creatorContract.address);

  const CreatorContractFactory = await ethers.getContractFactory("CreatorContractFactory");
  console.log("Get the contract factory ABI");
  const creatorContractFactory = await CreatorContractFactory.deploy(creatorContract.address);
  console.log("Creator Contract Factory Address:", creatorContractFactory.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
});