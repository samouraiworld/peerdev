contract EventEmitter {
    event Transfer(address indexed from, address indexed to, uint256 amount);
    
    function transfer(address to, uint256 amount) public {
        // Transfer logic
        emit Transfer(msg.sender, to, amount);
    }
}
