pragma solidity ^ 0.5.1;

/**
@title   Certs Ledger 
@author  Elders Team
@notice compatible with  v0.5.10 commit.5a6ea5b1 
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

}
