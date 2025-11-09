// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract EmergencyStop is Ownable {
    bool private stopped = false;
    
    constructor() Ownable(msg.sender) {}
    
    function assertNotStopped() private view {
        require(!stopped, "Contract stopped");
    }
    
    function emergencyStop() public onlyOwner {
        stopped = true;
    }
    
    function resume() public onlyOwner {
        stopped = false;
    }
    
    function doSomething() public {
        assertNotStopped();
        // Normal logic
    }
}
