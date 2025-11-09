// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC20 {
    mapping(address => uint256) public balanceOf;
    string public name = "MyToken";
    string public symbol = "MTK";
    
    function transfer(address to, uint256 amount) public {
        require(balanceOf[msg.sender] >= amount);
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
    }
    
    function mint(address to, uint256 amount) public {
        balanceOf[to] += amount;
    }

    function getBalanceOf(address addr) public view returns (uint256) {
        return balanceOf[addr];
    }
}
