// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

// Interface that implementations must follow
interface ILogic {
    function execute(string memory args) external;
}

contract Proxy is Ownable {
    ILogic private implContract;
    
    constructor() Ownable(msg.sender) {}
    
    function upgrade(ILogic newImpl) public onlyOwner {
        implContract = newImpl;
    }
    
    function getImplementation() public view returns (ILogic) {
        return implContract;
    }
    
    function execute(string memory args) public {
        require(address(implContract) != address(0), "No implementation set");
        implContract.execute(args);
    }
}
