# Homework 5:

# Badger coin contract
1. Create an BEP20 contract with the following details :
Name : "BadgerCoin"
Symbol : "BC"
Decimals : 18
Initial supply : 1000000 tokens
Deploy this to a test network and exchange some with your colleagues.
You may inherit from Open Zeppelin contracts.

** My Wallet:
0x19b8eaa49a3cd72ad35e3013de2670177a2695f8

Contract BadgerCoin

https://testnet.bscscan.com/tx/0xd2597ee01da02afe66426539deba20dc1dd801ca5350f03746509a586f5c168c
BadgerCoin.Sol


# Useful links relevant to the homework for today:
Link to obtain an API key to verify contracts: https://bscscan.com/myapikey
Chainlist filtered to add testnet to your MetaMask: https://chainlist.org/?search=binance&testnets=true
BNB testnet faucet to get tBNB: https://testnet.bnbchain.org/faucet-smart

*** Verify
 ** ABICode:
 
[
	{
		"inputs": [],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"name": "balances",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]
