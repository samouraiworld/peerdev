contract StateLock {
    enum State { Open, Closed, Paused }
    State public state;
    
    modifier inState(State _state) {
        require(state == _state, "Invalid state");
        _;
    }
    
    function doSomething() public inState(State.Open) {
        // Only callable when Open
    }
}
