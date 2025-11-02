contract ERC20 {
    mapping(address => uint256) public balanceOf;
    
    function transfer(address to, uint256 amount) public {
        require(balanceOf[msg.sender] >= amount);
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
    }
}
