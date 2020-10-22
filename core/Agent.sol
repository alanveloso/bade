// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.8.0;

contract Agent {
    
    function send(address receiver, bytes memory message) public returns (bytes memory){
        (bool success, bytes memory reply) = receiver.call(message);
        require(success);
        return reply;
    }

    function send(address receiver, bytes memory message, uint _value) public returns (bytes memory){
        (bool success, bytes memory reply) = receiver.call{value: _value}(message);
        require(success);
        return reply;
    }
}