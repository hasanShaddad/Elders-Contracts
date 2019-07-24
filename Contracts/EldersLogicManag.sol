pragma solidity ^ 0.5.1;

/**
@title  EldersLogicManag
@author  Elders Team
@notice compatible with  v0.5.10 commit.5a6ea5b1 
*/

import "./EldersUtilities.sol";
contract EldersLogicManag
{
     using EldersUtilities for address[];
       address _owner;
      address[] _elders;
    constructor(
        address[] memory  _eldersAddresses
    ) public {
       _elders =_eldersAddresses;
       _elders .push( msg.sender);
        _owner = msg.sender; 
    }
      
  //vote end time span
    uint VoteTimeSpan;
//to create voting on contracts or any other logic between prexes
   struct ContractVote {
        address ElderAddress;
        address[] contractAddresses;
        uint contractRole;
        bool IsForAdd;
        bool isAgree;
    }
    
    //add or remove Elder
     struct ElderVote {
        address ElderAddress;
        address[] ElderForVoteAddress;
        bool IsForAdd;
        bool isAgree;
    }
   // temp mapping for contract voting processor 
    mapping(address=>ContractVote)TempContractVote;
    // temp mapping for Elders voting processor 
    mapping(address=>ElderVote)TempElderVote;
    //address mapping to role for logic contracts to be added after voting
    mapping(address=>uint) AllowedContractsAddresses;
    
    //function AddNewContractVote(_elderAddress,_contractAddress,_contractRole,_isForAdd,_isAgree);
    // function SetVoteEndTimeSpan(_endVoteTimeSpan);
    //function AddNewLogicContracts(_contractAddress,_contractRole);
    //function GetContractVoteResult(_contractAddress,_contractRole,_isForAdd);
     //function AddNewElderVote(_elderAddress,_elderForVoteAddress,_isForAdd,_isAgree);
     //function GetElderVoteResult(_elderAddress,_isForAdd);
     //function AddNewElder(_elderAddress);
    
}
