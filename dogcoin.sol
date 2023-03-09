

// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.18;

contract DogCoin {
    uint256 totalSupply;
    address owner;
    mapping(address => uint256) public balances;

    constructor(){
        totalSupply = 2000000;
        owner = msg.sender;
        balances[owner] = totalSupply;
    }

    event TotalSupplyIncreased(uint256);
    event Transfer(address, address, uint256);

    struct Payment {
        address recipient;
        uint256 amount;
    }

    mapping(address => Payment[]) public payments;

    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    function getTotalSupply() public view returns (uint256){
        return totalSupply;
    }

    function increaseTotalSupply() public onlyOwner {
        totalSupply += 1000;
        emit TotalSupplyIncreased(totalSupply);
    }

    function getBalance(address _address) public view returns (uint256){
        return balances[_address];
    }

    function transfer(address _address, uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        balances[_address] += _amount;
        payments[msg.sender].push(Payment(_address, _amount));
        emit Transfer(msg.sender, _address, _amount);
    }


}
