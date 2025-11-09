// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Visibility {
    uint256 public balance = 1000;
    uint256 private transactionCount = 0;
    uint256 internal internalValue = 42;
    
    function withdraw(uint256 amount) public {
        balance -= amount;
        incrementTxCount();
    }
    
    function incrementTxCount() private {
        transactionCount++;
    }
    
    function getBalance() external view returns (uint256) {
        return balance;
    }
}
