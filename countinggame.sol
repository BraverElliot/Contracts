/**
 * SPDX-License-Identifier:MIT
*/

// made by BraverElliot.eth (send me money)
pragma solidity ^0.8.7;

contract Countinggame {


    address [] public userArray;
    uint256 public number;
    constructor(){
        number=0;
    }
    function count() public {
        userArray.push(msg.sender);
        number+=1;
    }
}
