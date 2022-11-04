// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0;

contract Bank {

    mapping(address=>uint) funds;

    function addFunds() public payable 
    {
        funds[msg.sender] += msg.value;
    }

    function removeFunds(uint amount) public 
    {
        require(funds[msg.sender] >= amount);
        funds[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function getFunds() public view returns (uint) 
    {
        return funds[msg.sender];
    }
}