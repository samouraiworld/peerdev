// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    uint256 public id;
    
    constructor(uint256 _id) {
        id = _id;
    }
}

contract Factory {
    address[] public contracts;
    
    function createContract() public returns (address) {
        MyContract newContract = new MyContract(contracts.length);
        contracts.push(address(newContract));
        return address(newContract);
    }
    
    function getContractsCount() public view returns (uint256) {
        return contracts.length;
    }
}
