contract Mapping {
    mapping(address => uint256) public balances;
    
    function set(string memory key, address value) public {
        balances[key] = value;
    }
}
