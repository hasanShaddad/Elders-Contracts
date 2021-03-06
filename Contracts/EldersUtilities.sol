pragma solidity ^ 0.5.1;

/**
*@title  EldersUtilities 
*@author  Elders Team
*@notice compatible with  v0.5.10 commit.5a6ea5b1 
* @dev EldersUtilities is a helper library for uint and addresses  
*/
 
library EldersUtilities {

//Utilities functions to add or remove from array
 
    function find(
        uint[] memory data,
        uint value
    ) internal pure returns(uint) {
        uint i = 0;
        while (data[i] != value) {
            i++;
        }
        return i;
    }

    function removeByValue(
        uint[] memory data,
        uint value
    ) internal pure returns(uint[]memory) {
        uint i = find(data, value);
        return removeByIndex(data, i);
    }

    function removeByIndex(
        uint[] memory array,
        uint index
    ) internal pure returns(uint[] memory) {
        
        if (index >= array.length)
        {return array;}

        for (uint i = index; i<array.length-1; i++){
            array[i] = array[i+1];
        }
        delete array[array.length-1];
       
        return array;
    }


    function  DeleteValue(
        uint[] memory data,
        uint value
    ) internal pure returns(uint[] memory) {

        return  removeByValue(data, value);
    }

    function  UpdateValueByNew(
        uint[] memory data,
        uint oldValue,
        uint newValue
    ) internal pure returns(uint[] memory) {
        uint i = find(data, oldValue);

        data[i] = newValue;
        return data;
    }




//for addresses
  function findAddress(
        address[] memory data,
        address  value
    ) internal pure returns(uint) {
        uint i = 0;
        while (data[i] != value) {
            i++;
        }
        return i;
    }

    function removeAddressByValue(
        address[] memory data,
        address value
    ) internal pure returns(address[] memory) {
        uint i = findAddress(data, value);
        return removeAddressByIndex(data, i);
    }

    function removeAddressByIndex(
        address[] memory array,
        uint index
    ) internal pure returns(address[] memory) {
        if (index >= array.length) return array;
 
        for (uint i = index; i<array.length-1; i++){
            array[i] = array[i+1];
        }
        delete array[array.length-1];
       
        return array;
    }


    function DeleteAddressValue(address[] memory data,
        address value
    ) internal pure returns(address[] memory) {

        return removeAddressByValue(data, value);
    }

    function UpdateAddressValueByNew(address[] memory data,
        address oldValue,
        address newValue
    ) internal pure returns(address[] memory) {
        uint i = findAddress(data, oldValue);
        data[i] = newValue;
        return data;
    }

 

}
