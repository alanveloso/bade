// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.8.0;

contract Agent {
    
    function send(address receiver, bytes memory message) public {
        (bool success, ) = receiver.call(message);
        require(success);
    }

    function send(address receiver, bytes memory message, uint _value) public {
        (bool success, ) = receiver.call{value: _value}(message);
        require(success);
    }
}