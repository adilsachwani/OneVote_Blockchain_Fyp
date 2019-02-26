pragma solidity ^0.5.4;

contract Voter{
    
    address voter;
    
    constructor() public payable{
        voter = msg.sender;
    }
    
    modifier voteronly(){
        if(msg.sender == voter){
            _;
        }
        else{
            revert();
        }
    }
    
}