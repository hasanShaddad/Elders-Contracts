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
      uint _minimumEldersPercentageToVote;
    constructor(
        address[] memory  eldersAddresses,
        uint  minimumEldersPercentageToVote
       
    )  public ValIsBetween( minimumEldersPercentageToVote ,100,1) {
        
       _elders =eldersAddresses;
       _minimumEldersPercentageToVote=minimumEldersPercentageToVote;
       _elders .push( msg.sender);
        _owner = msg.sender; 
    }
      //modifires
      modifier ValIsBetween(uint _val,uint _maxVal,uint _minVal){
          bool result=_val>=_minVal &&_val<=_maxVal;
          require(result,"value is out of limit");
          _;
      }
      
      //events
     
  //vote end time span
    uint ContractVoteTimeSpan;
      uint ElderVoteTimeSpan;
//to create voting on contracts or any other logic between prexes
   struct ContractVoteDetails {
        
        address[] contractAddresses;
        uint contractRole;
        bool IsForAdd;
        bool isAgree;
    }
    ContractVoteDetails _ContractVoteDetails;
    //add or remove Elder
     struct ElderVoteDetails {
        address[] EldersForVoteAddress;
        bool IsForAdd;
        bool isAgree;
    }
    ElderVoteDetails _ElderVoteDetails;
   // temp mapping for contract voting processor 
    mapping(uint=>address[])TempContractVote;
    // temp mapping for Elders voting processor 
    mapping(uint=>address[])TempElderVote;
    //address mapping to role for logic contracts to be added after voting
    mapping(address=>uint) AllowedContractsAddresses;
    
    
    /**
    
    //set Cotract vote details
    
    function SetCotractVoteDetails()internal TempContractVoteIsEmpty(){
        
    }
    
    //function AddNewContractVote(_elderAddress,_contractAddress,_contractRole,_isForAdd,_isAgree);
 
    function AddNewContractVote(address _elderAddress, bool _isAgree) internal
    AddressIsElder(_elderAddress) ContractVoteNotExist(_elderAddress) ContractVoteDetailsNotEmpty()
    {
        
    }

      function SetContractVoteEndTimeSpan(_endVoteTimeSpan);
    function AddNewLogicContracts(_contractAddress,_contractRole);
     function GetContractVoteResult(_contractAddress,_contractRole,_isForAdd);
     function AddNewElderVote(_elderAddress ,_isAgree);
      function SetElderVoteEndTimeSpan(_endVoteTimeSpan);
     function GetElderVoteResult(_elderAddress,_isForAdd);
     function AddNewElder(_elderAddress);
    */
}
