// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {FlashLoanSimpleReceiverBase} from "@aave/core-v3/contracts/flashloan/base/FlashLoanSimpleReceiverBase.sol";
import {IPoolAddressesProvider} from "@aave/core-v3/contracts/interfaces/IPoolAddressesProvider.sol";
import {IERC20} from "@aave/core-v3/contracts/dependencies/openzeppelin/contracts/IERC20.sol";



abstract contract Flashloan is FlashLoanSimpleReceiverBase { 
    address payable owner; 

    constructor(address _addressProvider) FlashLoanSimpleReceiverBase(IPoolAddressesProvider(_addressProvider)) 
    {
        owner = payable(msg.sender);
    }
    function executeOperation(
        address calldata asset,
        uint256 calldata amount,
        uint256 calldata premium,
        address initiator,
        bytes calldata params
  ) external returns (bool) {
    // we have borrowed funds
    // custom logic
    uint256 amountOwed = amount + premium;

    IERC20(assert).approve(address(POOL), amountOwed);

    return true;
  }

}

