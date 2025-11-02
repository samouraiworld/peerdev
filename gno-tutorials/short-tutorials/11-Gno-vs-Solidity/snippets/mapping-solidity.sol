contract Mapping {
    mapping(address => uint256) public balances;
    mapping(string => address) public registry;
    
    function set(string memory key, address value) public {
        registry[key] = value;
    }
}
