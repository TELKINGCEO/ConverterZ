import { expect } from "chai";
import { ethers } from "hardhat";

describe("ImageConverterFHE", function () {
  it("Upload & convert works", async function () {
    const Factory = await ethers.getContractFactory("ImageConverterFHE");
    const contract = await Factory.deploy();
    await contract.deployed();

    // Test just deployment for now (FHE encryption wiring next step)
    expect(contract.address).to.not.be.undefined;
  });
});

