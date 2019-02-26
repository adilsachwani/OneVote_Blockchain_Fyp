pragma solidity ^0.5.4;

contract Voter{
    
    address payable voter;
    
    constructor() public{
        voter = msg.sender;
    }
    
    modifier voteronly(){
        if(msg.sender == voter){
            _;
        }
    }
    
}