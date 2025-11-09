// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SpeedBump {
    mapping(address => uint256) private lastActionTime;
    uint256 private constant DELAY = 24 hours;
    
    function assertRateLimit() private {
        address caller = msg.sender;
        uint256 lastTime = lastActionTime[caller];
        
        uint256 timeNow = block.timestamp;
        require(lastTime == 0 || timeNow - lastTime >= DELAY, "Rate limit: please wait");
        
        lastActionTime[caller] = timeNow;
    }
    
    function withdraw() public {
        assertRateLimit();
        // Withdrawal logic
    }
}
