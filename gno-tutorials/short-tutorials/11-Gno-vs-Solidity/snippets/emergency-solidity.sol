contract EmergencyStop {
    bool public stopped = false;
    
    modifier stopInEmergency() {
        require(!stopped, "Contract stopped");
        _;
    }
    
    function emergencyStop() public onlyOwner {
        stopped = true;
    }
    
    function resume() public onlyOwner {
        stopped = false;
    }
}
