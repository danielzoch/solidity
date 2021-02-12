contract D {
    constructor(function() external returns (uint) ) {
    }
}

contract C {
    function f() public {
        // An assert used to fail in ABIFunction.cpp that the function types are not exactly equal
        // that is pure or view v/s default even though they could be converted.
        D d1 = new D(this.testPure);
        D d2 = new D(this.testView);
        D d3 = new D(this.testDefault);
        d1;
        d2;
        d3;
    }

    function testPure() public pure returns (uint) {
    }

    function testView() public view returns (uint) {
        block.timestamp;
    }

    function testDefault() public returns (uint) {
        selfdestruct(payable(address(this)));
    }
}
// ----
// Warning 6321: (558-562): Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
// Warning 6321: (641-645): Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
