// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mapping {
    mapping(address => uint256) public balances;
    
    function get(address key) public view returns (uint256) {
        return balances[key];
    }
    
    function set(address key, uint256 value) public {
        balances[key] = value;
    }
}
