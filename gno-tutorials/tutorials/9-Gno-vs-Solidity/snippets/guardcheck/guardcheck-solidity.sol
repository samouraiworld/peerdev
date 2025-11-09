// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GuardCheck {
    modifier assertValidAmount(uint256 amount) {
        require(amount > 0, "Amount must be positive");
        require(amount <= 1000, "Amount too large");
        _;
    }
    
    function transfer(uint256 amount) public assertValidAmount(amount) {
        // Transfer logic
    }
}
