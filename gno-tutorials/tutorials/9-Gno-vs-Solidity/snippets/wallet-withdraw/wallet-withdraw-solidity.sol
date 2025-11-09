// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Wallet {
    mapping(address => uint256) private balances;
    
    function withdraw(uint256 amount) public {
        address caller = msg.sender;
        uint256 balance = getBalance(caller);
        require(balance >= amount, "Insufficient balance");
        
        setBalance(caller, balance - amount);
        
        // Send coins
        payable(caller).transfer(amount);
    }
    
    function getBalance(address addr) private view returns (uint256) {
        return balances[addr];
    }
    
    function setBalance(address addr, uint256 amount) private {
        balances[addr] = amount;
    }
}
