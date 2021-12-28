require("@nomiclabs/hardhat-waffle");

module.exports = {
  solidity: "0.8.6",
  defaultNetwork: "rinkeby",
  networks: {
    hardhat: {},
    rinkeby: {
       url: "An alchemy URL to connect to ethereum (or Infura)",
       accounts: ["Your private key, use a .env variable"]
    }
 },
};
