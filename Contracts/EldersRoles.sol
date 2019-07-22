pragma solidity ^ 0.5.1;

/**
@title   Certs Ledger 
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
        elder,
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
    
    
     function RemoveTypeFromUser(
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
 
}
