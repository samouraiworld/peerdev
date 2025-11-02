contract GuardCheck {
    modifier validAmount(uint256 amount) {
        require(amount > 0, "Amount must be positive");
        require(amount <= 1000, "Amount too large");
        _;
    }
    
    function transfer(uint256 amount) public validAmount(amount) {
        // Transfer logic
    }
}
