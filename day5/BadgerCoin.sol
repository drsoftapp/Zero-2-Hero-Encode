// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BadgerCoin {
    uint256 InitialSupply;
    
    uint8 Decimals;
    string Symbols;
    
 
    address owner;
    mapping(address => uint256) public balances;

    constructor(){
        Symbols ="BC";
        Decimals = 18;
        InitialSupply = 1000000;
        owner = msg.sender;
        balances[owner] = InitialSupply;

    }
}