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
     uint _eldersCount;
      uint _minimumEldersPercentageToVote;
  
  
  
    constructor(
        address[] memory  eldersAddresses,
        uint  minimumEldersPercentageToVote
       
    )  public ValIsBetween( minimumEldersPercentageToVote ,100,1) {
         eldersAddresses .push( msg.sender);
      _eldersCount =eldersAddresses.length;
      AddAddressesToElders(eldersAddresses);
       _minimumEldersPercentageToVote=minimumEldersPercentageToVote;
        _owner = msg.sender; 
    }
    
 
      
      //events
     
  //vote end time span
    uint ContractVoteTimeSpan;
      uint ElderVoteTimeSpan;
      
      
      
//to create voting on contracts or any other logic between prexes
   struct  ContractVoteDetails {
        address[] ContractAddresses;
        uint ContractRole;
        bool IsForAdd;
     uint VotersCount;
     uint AgrredVoicesCount;
    }

    //add or remove Elder
     struct ElderVoteDetails {
        address[] EldersForVoteAddress;
        bool IsForAdd;
       uint VotersCount;
   uint AgrredVoicesCount;
    }
        
    ContractVoteDetails _ContractVoteDetails;
    ElderVoteDetails _ElderVoteDetails;
    
    
    
    
    
    //mappings
    
    
   // temp mapping for contract voting processor 1 or 2 as boolian mapping to elders addresses
    mapping(address=>uint)TempContractVote;
    // temp mapping for Elders voting processor 
    mapping(address=>uint)TempElderVote;
    //address mapping to role for logic contracts to be added after voting
    mapping(address=>uint) AllowedContractsAddresses;
    //Elders
    mapping(address=>bool) Elders;
    
    
    
    
    
    
    
    
    
      //modifires
      modifier ValIsBetween(uint _val,uint _maxVal,uint _minVal){
          bool result=_val>=_minVal &&_val<=_maxVal;
          require(result,"value is out of limit");
          _;
      }
      
      modifier TempContractVoteIsEmpty(){
          require(ContractVoteDetails.VotersCount==0 ,"Temp Contract Vote Is not Empty");
          _;
      }
    
      modifier SenderIsOwner(address _senderAddress){
          require(_senderAddress == _owner,"sender is not the owner");
          _;
      }
      
      modifier ElderAddressIsValid(address _elderAddress,bool _hasToBe){
          require(Elders[_elderAddress]== _hasToBe," Elder address as not valid");
          _;
          }
          
             modifier AddressIsOwner(address _address){
             require(_address== _owner,"address is not for owner");
          _;   
          }
          
          
          modifier ContractVoteNotExist(address _elderAddress){
              require(TempContractVote[_elderAddress]==0,"Contract Vote for this elder is Exist");
           _;
          }
          
         modifier  ContractVoteDetailsNotEmpty(){
               _ContractVoteDetails.ContractAddresses != address(0);
               _;
          }
          
          modifier ContractVoteTimeSpanIsValid(){
              ContractVoteTimeSpan>now;
              _;
          }
          
          modifier VotersPersentageIsValid(){
           uint votersCount=    _ContractVoteDetails.VotersCount;
        uint voterPersent = 100*(votersCount/ _eldersCount);
        require(voterPersent>50,"Voters Persentage Is not Valid");
       _;
          }
          
          
          
          
        //functions  
          
 
          //add default elders to Elders mapp
     function AddAddressesToElders(address[] memory _elderAddresses) private{
        for(uint i =0; i< _elderAddresses.length; i++){
            Elders[ _elderAddresses[i]]=true;
        }     
     }   
          
          
    //set Cotract vote details
    
    function SetContractVoteDetails( address[] memory _contractAddresses,
        uint _contractRole,
        bool _isForAdd)
        internal 
        TempContractVoteIsEmpty()
        SenderIsOwner(msg.sender)
        {
        _ContractVoteDetails =ContractVoteDetails (_contractAddresses, _contractRole,_isForAdd);
    }
    
    function EmptyContractVoteDetails()
     internal 
        TempContractVoteIsEmpty()
        SenderIsOwner(msg.sender)
     {
        _ContractVoteDetails.ContractAddresses = address(0);
        _ContractVoteDetails.ContractRole=0;
        _ContractVoteDetails.AgrredVoicesCount=0;
         _ContractVoteDetails.IsForAdd;
         SetContractVoteEndTimeSpan(-1);
    }
    //function AddNewContractVote(_elderAddress,_contractAddress,_contractRole,_isForAdd,_isAgree);
 
    function VoteOnNewContract(address _elderAddress, bool _isAgree) internal
    ElderAddressIsValid(_elderAddress,true) ContractVoteNotExist(_elderAddress) ContractVoteDetailsNotEmpty() ContractVoteTimeSpanIsValid()
    {
        uint result =0;
        if(_isAgree){
            result =1;
           _ContractVoteDetails.AgrredVoicesCount++;
        }else
        {
             result =2;
        }
        
        TempContractVote[_elderAddress]=result;
        _ContractVoteDetails.VotersCount++;
        
    }
 
     function SetContractVoteEndTimeSpan(_endVoteTimeSpan)public view AddressIsOwner(msg.sender){
         ContractVoteTimeSpan =_endVoteTimeSpan;
     }
     
     
   
     function GetContractVoteResult(address _contractAddress,uint _contractRole,bool _isForAdd)public
     VotersPersentageIsValid() returns(bool _result){
         var result =100*( _ContractVoteDetails.AgrredVoicesCount/votersCount);
         return result>=50;
     }
     
     
      function AddNewLogicContracts(_contractAddress,_contractRole);
      function GetContractVoteDetails()
     
     function AddNewElderVote(_elderAddress ,_isAgree);
 
      function SetElderVoteEndTimeSpan(_endVoteTimeSpan);
     function GetElderVoteResult(_elderAddress,_isForAdd);
     function AddNewElder(_elderAddress);
     function GetEldersVoteDetails()
     
}
