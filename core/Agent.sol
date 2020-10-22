// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.8.0;

contract Agent_ {
    
    function send(address receiver, bytes memory message) public {
        if (receiver != address(this)) {
            (bool success, ) = receiver.call(message);
            require (success,'delivery-message-failure');
        }
    }

    function send(address receiver, bytes memory message, uint _value) public {
        if (receiver != address(this)) {
            (bool success, ) = receiver.call{value: _value}(message);
            require (success,'delivery-message-failure');
        }
    }

    function send(address[] memory receivers, bytes memory message) public {
        for (uint i = 0; i < receivers.length; i++) {
            if (receivers[i] != address(this)) {
                (bool success, ) = receivers[i].call(message);
                require (success,'delivery-message-failure');
            }
        }
    }

    function send(address[] memory receivers, bytes memory message, uint _value) public {
        for (uint i = 0; i < receivers.length; i++) {
            if (receivers[i] != address(this)) {
                (bool success, ) = receivers[i].call{value: _value}(message);
                require (success,'delivery-message-failure');
            }
        }
    }
}

// contract Agent is Agent_ {

//     address aid;
//     Packet[] Packet;
    

//     constructor () {
        
//     }

//     fallback() {
        
//     }
// }

library Packet {
    
    struct packet {
        address sender;
        bytes content;
        mapping (string => bool) performatives;

        performatives['accept-proposal'] = true;
        performatives['agree'] = true;
        performatives['cancel'] = true;
        performatives['cfp'] = true;
        performatives['call-for-proposal'] = true;
        performatives['confirm'] = true;
        performatives['disconfirm'] = true;
        performatives['failure'] = true;
        performatives['inform'] = true;
        performatives['not-understood'] = true;
        performatives['propose'] = true;
        performatives['query-if'] = true;
        performatives['query-ref'] = true;
        performatives['refuse'] = true;
        performatives['reject-proposal'] = true;
        performatives['request'] = true;
        performatives['request-when'] = true;
        performatives['request-whenever'] = true;
        performatives['subscribe'] = true;
        performatives['inform-if'] = true;
        performatives['proxy'] = true;
        performatives['propagate'] = true;
    }
}