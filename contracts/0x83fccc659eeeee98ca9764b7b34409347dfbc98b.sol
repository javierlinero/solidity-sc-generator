pragma solidity ^0.4.24;

contract ethernity {
    address pr = 0x587a38954aD9d4DEd6B53a8F7F28D32D28E6bBD0;
    address ths = this;
    
    mapping (address => uint) balance;
    mapping (address => uint) paytime;
    mapping (address => uint) prtime;
    
    function() external payable {
        if((block.number-prtime[pr]) >= 5900){
            pr.transfer(ths.balance / 100);
            prtime[pr] = block.number;
        }
        if (balance[msg.sender] != 0){
            msg.sender.transfer((block.number-paytime[msg.sender])/5900*balance[msg.sender]/100*5);
        }
        paytime[msg.sender] = block.number;
        balance[msg.sender] += msg.value;
    }
}
/* 
Automatic investment allocation program
Payments 5% every 5900 blocks (24 Hours)

Participation
If you want to participate in the program send from your personal ETH wallet to the smart contract address any amount from 0.01 ETH. 

Payments
You can receive a payment at any time by sending 0 ETH to the address of the smart-contract.

You can check your payments in the "Internal Txns" tab of your wallet. 

The recommended gas limits: 100 000, actual gas price can you take with ethgasstation.info

Warning: It's allowed only from your personal ETH wallet, for which you have private keys.

Payments will continue while there are funds on the balance of the smart contract. 
*/