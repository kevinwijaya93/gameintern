contract A {
    function f() internal virtual returns(uint) { return 3; }
}

contract B {
    uint immutable x;

    constructor() {
        x = xInit();
    }

    function xInit() internal virtual returns(uint) {
        return f();
    }

    function f() internal view virtual returns(uint) { return 3; }
}

contract C is A, B {
    function xInit() internal override returns(uint) {
        return B.xInit();
    }

    function f() internal view override(A, B) returns(uint) {
        return x;
    }
}
// ----
