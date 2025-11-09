// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReentrancyGuard {
    bool private locked;
    
    function assertNotLocked() private {
        require(!locked, "Reentrant call");
        locked = true;
    }
    
    function unlock() private {
        locked = false;
    }
    
    function withdraw() public {
        assertNotLocked();
        // Safe withdrawal
        unlock();
    }
}
