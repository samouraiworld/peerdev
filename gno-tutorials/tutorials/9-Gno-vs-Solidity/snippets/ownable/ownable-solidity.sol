// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract MyOwnable is Ownable {
    constructor() Ownable(msg.sender) {}
    
    function restrictedAction() public onlyOwner {
        // Only owner can call
    }
    
    function transferOwnership(address newOwner) public override onlyOwner {
        require(newOwner != address(0), "Invalid address");
        super.transferOwnership(newOwner);
    }
    
    function getOwner() public view returns (address) {
        return owner();
    }
}
