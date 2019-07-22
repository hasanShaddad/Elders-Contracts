pragma solidity ^ 0.5.1;

/**
@title   Certs Ledger 
@author  Elders Team
@notice compatible with  v0.5.10 commit.5a6ea5b1 
*/

import "./EldersRoles.sol";

contract test {
     using EldersRoles for EldersRoles.Roles;
     
        EldersRoles.Roles private _roles;
        
        
        function addRoleToAccount(address _account ,uint _role )public{
            _roles.AddRoleToAccount(_role,_account);
        }
        
        function setMaxRollArrayVal(uint8 val)public{
              _roles.SetMaxRolesArrayLength(val);
        }
        
}