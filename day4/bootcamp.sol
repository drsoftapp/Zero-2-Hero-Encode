// SPDX-License-Identifier: None

pragma solidity ^0.8.17;


contract BootcampContract {

    uint256 number;
    address owner;

    constructor() {
        owner = msg.sender;
    }


    function store(uint256 num) public {
        number = num;
    }


    function retrieve() public view returns (uint256){
        return number;
    }

    function getAddress() external view returns (address){
        address temp = 0x000000000000000000000000000000000000dEaD;
        if(msg.sender == owner){
            return temp;
        }else{
            return owner;
        }
    }
}
