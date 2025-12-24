import { ethers } from "hardhat";

async function main() {
  const Factory = await ethers.getContractFactory("ImageConverterFHE");
  const contract = await Factory.deploy();
  await contract.deployed();

  console.log("ImageConverter deployed to:", contract.address);
}

main();

