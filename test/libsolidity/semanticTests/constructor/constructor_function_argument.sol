// The IR of this test used to throw
contract D {
    constructor(function() external returns (uint)) {}
}
// ====
// compileViaYul: also
// ----
// constructor() -> FAILURE
