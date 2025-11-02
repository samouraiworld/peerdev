contract Factory {
    address[] public contracts;
    
    function createContract() public returns (address) {
        MyContract newContract = new MyContract();
        contracts.push(address(newContract));
        return address(newContract);
    }
}
