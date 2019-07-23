pragma solidity ^ 0.5.1;


contract EldersLogicManag
{
  //vote end time span
    uint VoteTimeSpan;
//to create voting on contracts or any other logic between prexes
   struct PrexVoter {
        address prexAddress;
        address[] contractAddresses;
        uint contractRole;
        bool IsForAdd;
        bool isAgree;
    }
   // temp mapping for voting processor 
    mapping(address=>PrexVoter)TempVote;
    //address mapping to role for logic contracts to be added after voting
    mapping(address=>uint) AllowedContractsAddresses;
}