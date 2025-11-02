contract SpeedBump {
    mapping(address => uint256) public lastActionTime;
    uint256 public constant DELAY = 1 days;
    
    modifier rateLimit() {
        require(block.timestamp >= lastActionTime[msg.sender] + DELAY);
        _;
        lastActionTime[msg.sender] = block.timestamp;
    }
    
    function withdraw() public rateLimit {
        // Withdrawal logic
    }
}
