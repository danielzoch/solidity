contract D {
    constructor(function() external pure returns (uint) ) {
    }
}

contract C {
    function f() public returns (uint r) {
        // An assert used to fail the function types are not exactly equal (pure, view) v/s default
        // ok
        D d1 = new D(this.testPure);
        // not okay
        D d2 = new D(this.testView);
        // not okay
        D d3 = new D(this.testDefault);
        // not okay
        D d4 = new D(this.testDifferentSignature);
    }

    function testPure() public pure returns (uint) {
    }

    function testView() public view returns (uint) {
        block.timestamp;
    }

    function testDefault() public returns (uint) {
        selfdestruct(payable(address(this)));
    }

    function testDifferentSignature(uint a) public pure returns (uint) {
    }
}
// ----
// TypeError 9553: (330-343): Invalid type for argument in function call. Invalid implicit conversion from function () view external returns (uint256) to function () pure external returns (uint256) requested.
// TypeError 9553: (387-403): Invalid type for argument in function call. Invalid implicit conversion from function () external returns (uint256) to function () pure external returns (uint256) requested.
// TypeError 9553: (447-474): Invalid type for argument in function call. Invalid implicit conversion from function (uint256) pure external returns (uint256) to function () pure external returns (uint256) requested.
