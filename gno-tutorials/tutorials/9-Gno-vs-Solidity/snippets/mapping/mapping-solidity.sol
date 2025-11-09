// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mapping {
    mapping(address => uint256) public balances;
    
    function set(string memory key, address value) public {
        balances[key] = value;
    }
}
