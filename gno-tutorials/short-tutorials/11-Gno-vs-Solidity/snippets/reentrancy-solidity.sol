contract ReentrancyGuard {
    bool private locked;
    
    modifier noReentrant() {
        require(!locked, "Reentrant call");
        locked = true;
        _;
        locked = false;
    }
    
    function withdraw() public noReentrant {
        // Safe withdrawal
    }
}
