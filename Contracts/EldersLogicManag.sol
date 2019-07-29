pragma solidity ^ 0.5.1;

/**
@title  EldersLogicManag
@author  Elders Team
@notice compatible with  v0.5.10 commit.5a6ea5b1 
*/

import "./EldersUtilities.sol";
import "./EldersVotingManag.sol";
contract EldersLogicManag is EldersVotingManag
{
 
       address _owner;
 
    constructor(
        address[] memory  eldersAddresses,
        uint  minimumEldersPercentageToVote 
       
    ) public    ValIsBetween( minimumEldersPercentageToVote ,100,1){
        AddAddressesToElders(eldersAddresses,minimumEldersPercentageToVote);
        _owner = msg.sender; 
    }
    
 
     
        mapping(address=>uint) private logicContracts;
    
 
    
      //modifires
 
             modifier AddressIsOwner(address _address){
             require(_address== _owner,"address is not for owner");
          _;   
          }
 
          
         modifier  ContractVoteDetailsNotEmpty(){
              require(_ContractVoteDetails.ContractAddress != address(0)&&_ContractVoteDetails.ContractRole !=0 ,"contract data not valid");
             
               _;
          }
 
      function AddNewLogicContract(address _contractAddress) public AddressIsOwner(msg.sender) ContractVoteDetailsNotEmpty(){
         require(GetContractVoteResult( _contractAddress),"elders refused this contract");
         require( _ContractVoteDetails.IsForAdd,"voting is not for adding contract");
          logicContracts[ _ContractVoteDetails.ContractAddress]=  _ContractVoteDetails.ContractRole;
           EmptyContractVoteDetails();
      } 
      
      function RemoveLogicContract(address _contractAddress) public AddressIsOwner(msg.sender) ContractVoteDetailsNotEmpty(){
         require(GetContractVoteResult( _contractAddress),"elders refused this contract");
         require( _ContractVoteDetails.IsForAdd==false,"voting is not for removing contract");
          logicContracts[ _ContractVoteDetails.ContractAddress]= 0;
           EmptyContractVoteDetails();
      } 
      
      
      
         
}
