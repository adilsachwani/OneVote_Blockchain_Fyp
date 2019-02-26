pragma solidity ^0.5.4;

import "github.com/adilsachwani/OneVote_Blockchain_Fyp/prac_contracts/voter.sol";

contract MyVote is Voter{
    
    uint vote;

    constructor() public payable{
        vote = 0;
    }
    
    function setVote(uint v) public voteronly{
        vote = v;
    }
    
    function getVote() public view returns(uint){
        return vote;
    }
    
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    
    function () external payable{
        
    }
    
}