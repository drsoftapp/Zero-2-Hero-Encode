### Solidity

To the contract [`Bootcamp.sol`](https://gist.github.com/extropyCoder/77487267da199320fb9c852cfde70fb1):

1. Add a variable to hold the address of the deployer of the contract;
2. Update that variable with the deployer's address when the contract is deployed;
3. Write an external function to return:
    - Address 0x000000000000000000000000000000000000dEaD if called by the deployer;
    - The deployer's address otherwise.

Based on the requirements above, we edited the contract as reported below.

```solidity
// SPDX-License-Identifier: None

pragma solidity 0.8.17;


contract BootcampContract {

    uint256 number;

    address public owner;



    constructor() {
        owner = msg.sender;
    }

    function getStrangeAddress() public view returns (address) {
        if (msg.sender==owner) {
            return 0x000000000000000000000000000000000000dEaD;
        } else {
            return owner;
        }      
    }


    function store(uint256 num) public {
        number = num;
    }


    function retrieve() public view returns (uint256){
        return number;
    }
}
```

### DogCoin contract

1. In Remix, create a new file called `DogCoin.sol`.
2. Define the pragma compiler version to 0.8.18.
3. Before the pragma version, add a license identifier `// SPDX-License-Identifier: UNLICENSED.`
4. Create a contract called DogCoin.
5. Create a variable to hold the total supply, with an initial amount of 2 million.
6. Make a public function that returns the total supply.
7. Make a public function that can increase the total supply in steps of 1000.
8. Declare an `address` variable called `owner`. This address will be allowed to change the total supply.
9. Next, create a `modifier` which only allows an owner to execute certain functions.
10. Make your change total supply function `public`, but add your modifier so that only the owner can execute it.
11. Create a constructor to initialise the state of the contract and within the constructor, store the owner's address.
12. Create an event that emits the new value whenever the total supply changes. When the supply changes, emit this event.
13. In order to keep track of user balances, we need to associate a user's address with the balance that they have.
    a) What is the best data structure to hold this association?
    b) Using your choice of data structure, set up a variable called `balances` to keep track of the number of tokens that a user has.
14. We want to allow the balances variable to be read from the contract, there are 2 ways to do this. What are those ways? Use one of the ways to make your balances variable visible to users of the contract.
15. Now change the constructor, to give all of the total supply to the owner of the contract.
16. Now add a public function called `transfer` to allow a user to transfer their tokens to another address. This function should have 2 parameters:
    - the amount to transfer and
    - the recipient address
Why do we not need the sender's address here?
What would be the implication of having the sender's address as a parameter?
17. Add an `event` to the transfer function to indicate that a transfer has taken place, it should log the amount and the recipient address.
18. We want to keep a record for each user's transfers. Create a `struct` called `Payment` that stores the transfer amount and the recipient's address.
19. We want to have a payments array for each user sending the payment. Create a `mapping` which returns an array of Payment structs when given this user's address.

Based on the requirements above, we created the contract reported below.

```solidity
// SPDX-License-Identifier: UNLICENSED.

pragma solidity 0.8.18;

contract DogCoin {

    uint256 totalSupply;

    address public owner;

    struct Payment {
        address recipientAddress;
        uint256 transferAmount;
    }

    mapping(address => uint) public balances;

    mapping(address => Payment[]) public payments;

    event TotalSupplyNotification(uint256);
    event TransferNotification(uint256, address);

    modifier onlyOwner () {
        require(msg.sender==owner, "You are not allowed to do this.");
        _;
    }
    constructor() {
        totalSupply = 2000000;
        owner = msg.sender;
        balances[msg.sender] = totalSupply;
    }

    function transfer(address destination, uint256 amount) public {
        balances[destination] += amount;
        balances[msg.sender] -= amount;

        payments[msg.sender].push(Payment({recipientAddress: destination, transferAmount: amount}));

        emit TransferNotification(amount, destination);
    }

    function getPayments(address _address) public view returns (address[] memory, uint256[] memory) {
        Payment[] storage userPayments = payments[_address];

        address[] memory addresses = new address[](userPayments.length);
        uint256[] memory amounts = new uint[](userPayments.length);
        
        for (uint i = 0; i < userPayments.length; i++) {
            addresses[i] = userPayments[i].recipientAddress;
            amounts[i] = userPayments[i].transferAmount;
        }
        
        return (addresses, amounts);
    }

    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    function increaseTotalSupply() public onlyOwner {
        totalSupply += 1000;
        emit TotalSupplyNotification(totalSupply);
    }

}
```
