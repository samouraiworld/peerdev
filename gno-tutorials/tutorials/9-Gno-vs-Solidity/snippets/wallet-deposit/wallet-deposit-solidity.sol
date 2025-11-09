// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Wallet {
    mapping(address => uint256) private balances;
    
    function deposit() public payable {
        address caller = msg.sender;
        uint256 sent = msg.value;
        
        require(sent > 0, "No coins sent");
        
        uint256 balance = getBalance(caller);
        setBalance(caller, balance + sent);
    }
    
    function getBalance(address addr) private view returns (uint256) {
        return balances[addr];
    }
    
    function setBalance(address addr, uint256 amount) private {
        balances[addr] = amount;
    }
}
