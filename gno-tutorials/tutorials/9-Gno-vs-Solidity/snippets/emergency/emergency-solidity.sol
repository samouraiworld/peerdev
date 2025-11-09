// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmergencyStop {
    bool public stopped = false;
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }
    
    modifier stopInEmergency() {
        require(!stopped, "Contract stopped");
        _;
    }
    
    function emergencyStop() public onlyOwner {
        stopped = true;
    }
    
    function resume() public onlyOwner {
        stopped = false;
    }
    
    function doSomething() public stopInEmergency {
        // Normal logic
    }
}
