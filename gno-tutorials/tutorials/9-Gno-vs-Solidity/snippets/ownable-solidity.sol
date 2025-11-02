contract Ownable {
    address private owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }
    
    function restrictedAction() public onlyOwner {
        // Only owner can call
    }
}
