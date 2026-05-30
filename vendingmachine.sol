pragma solidity ^0.8.0;

contract VendingMachine {
    address public owner;
    uint public price = 1 ether;
    mapping(address => uint) public balances;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    function buy() public {
        require(balances[msg.sender] >= price, "insufficient balance");
        balances[msg.sender] -= price;
    }

    function withdraw() public {
        require(msg.sender == owner, "only owner");
        payable(owner).transfer(address(this).balance);
    }
}