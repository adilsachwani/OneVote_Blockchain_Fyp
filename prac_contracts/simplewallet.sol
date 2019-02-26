pragma solidity ^0.5.4;

import "./voter.sol";

contract SimpleWallet is Voter{
    
    struct Permission {
        bool isAllowed;
        uint maxAmount;
    }
    
    mapping(address => Permission) walletAllowedAddresses;
    
    function addAddress(address permit_address, uint max_amount) public voteronly{
        walletAllowedAddresses[permit_address] = Permission(true, max_amount);
    }
    
    function removeAddress(address restrict_address) public voteronly{
        delete walletAllowedAddresses[restrict_address];
    }
    
    function sendFunds(address payable reciever_address, uint amountInWei) public voteronly{
        
        if(walletAllowedAddresses[reciever_address].isAllowed){
            if(walletAllowedAddresses[reciever_address].maxAmount >= amountInWei){
                if(!reciever_address.send(amountInWei)){
                    revert();
                }
            }
            else{
                revert();
            }
        }
        else{
            revert();
        }
    }
    
    function() external payable{
        
    }
    
    function getBalanace() public view returns(uint){
        return address(this).balance;
    }
    
}