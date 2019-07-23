pragma solidity ^ 0.5.1;

/**
@title  EldersRoles
@author  Elders Team
@notice compatible with  v0.5.10 commit.5a6ea5b1 
*/

import "./EldersUtilities.sol";

library EldersRoles {
     using EldersUtilities for uint[];
     
    struct  Roles{
         //mapping account address to Roles
    mapping(address => uint[]) AccountRoles;
   // the maximum limit for type array
    uint8 MaxRolesArrayLength;
    }
     //rolles for persons 
    enum DefaultRoles {
        defaultVal,
        admin 
    }
 
 function SetMaxRolesArrayLength(Roles storage role,uint8 maxArrayVal)internal{
     role.MaxRolesArrayLength=maxArrayVal;
 }
 
    function AddRoleToAccount(
     Roles storage role,
        uint _role,
        address _accountAddress
       ) internal
  {
         require(RoleNotExistForUser(role, _accountAddress,_role), "Role is already exist");
         
      role.AccountRoles[_accountAddress].push(_role);
     
    }
    
    
     function RemoveRoleFromAccount(
     Roles storage role,
     uint _role,
        address _accountAddress 
        )internal
     {
 
uint[] memory  newRoles =role.AccountRoles[ _accountAddress];
    role.AccountRoles[ _accountAddress]=   newRoles.DeleteValue(_role);
       role.AccountRoles[ _accountAddress].length--;
        
    }
    
 
 function RoleNotExistForUser(
 Roles storage role,
            address _address,
            uint _roleID
             ) internal returns(bool){
            bool result = true;
            
            uint[] memory accountRoles =role.AccountRoles[_address];
              require(  accountRoles.length <uint8(role.MaxRolesArrayLength), "type is out of lemit");
            for (uint i = 0; i < accountRoles.length; i++) {
                
                if ( 
                    accountRoles[i] == _roleID) {
                    result = false;
                }
            }

           
            return result;
        }
 
 function AccountHasRoles(
  Roles storage role,
        uint[] memory _validationRoles,
        address _AccountAddress) internal returns(bool) {
        bool result = false;
        
            uint[] memory _accountRoles =  role.AccountRoles[ _AccountAddress];
            require(_validationRoles.length <uint(role.MaxRolesArrayLength), "cert-ledger-prefex(16)");
            require(_accountRoles.length < uint(role.MaxRolesArrayLength), "cert-ledger-prefex(16)");
            for (uint i = 0; i < _accountRoles.length; i++) {
                for (uint _role = 0;  _role < _validationRoles.length;  _role++) {
                    if (_validationRoles[ _role] == _accountRoles[i]) {
                        result = true;

                    }

                }

            }
        

       return result;
        

    }

 //if user is general elder
    function AccountIsAdmin(
     Roles storage role,
        address  _AccountAddress ) internal returns(bool)
        {
        bool result = false;
         
            uint[] memory _accountRoles = role.AccountRoles[ _AccountAddress];
            for (uint i = 0; i < _accountRoles.length; i++)
            {
                if ( 
                   _accountRoles[i] == uint(DefaultRoles.admin)) 
                    {
                    result = true;
                    }
            }
         
        
        require(result, "cert-ledger-prefex(1)");
       
         }



}
