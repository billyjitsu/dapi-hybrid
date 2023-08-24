import { ethers } from "hardhat";

async function main() {
  // The old way of deploying contracts
  // const Pricefeed = await ethers.getContractFactory("PriceFeed");
  // const pricefeed = await Pricefeed.deploy();
  // await pricefeed.waitForDeployment();

  // The new way of deploying contracts    Name of Contract, Constructor Arguments, Overrides
  const pricefeed = await ethers.deployContract("PriceFeed", [], {});

  await pricefeed.waitForDeployment();

  console.log(
    `PriceFeed contract address: ${pricefeed.target}
Polygonscan link: https://testnet-zkevm.polygonscan.com/address/${tokenEx.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
