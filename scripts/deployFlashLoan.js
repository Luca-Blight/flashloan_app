const hre = require('hardhat');

async function main() {
  const FlashLoan = await hre.ethers.getContractFactory('FlashLoan');
  const flashloan = await FlashLoan.deploy('0x52A27dC690F8652288194Dd2bc523863eBdEa236'); // address comes from sepolia aave IPoolAddressesProvider(0x52A27dC690F8652288194Dd2bc523863eBdEa236);

  await flashloan.deployed();
  console.log("Flash loan contract deployed to:", flashloan.address);

}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
