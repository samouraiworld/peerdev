contract Wallet {
    mapping(address => uint256) public balances;
    
    receive() external payable {
        balances[msg.sender] += msg.value;
    }
    
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }
}
