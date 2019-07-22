pragma solidity ^ 0.5.1;

/**
@title   Certs Ledger 
@author  Elders Team
@notice compatible with  v0.5.10 commit.5a6ea5b1 
*/
 
contract EldersUtilities {

//Utilities functions to add or remove from array


//functions for address
    function find(
        address[] memory data,
        address  value
    ) internal pure returns(uint) {
        uint i = 0;
        while (data[i] != value) {
            i++;
        }
        return i;
    }

    function removeByValue(
        address[] memory data,
        address value
    ) internal pure returns(address[] memory) {
        uint i = find(data, value);
        return removeByIndex(data, i);
    }

    function removeByIndex(
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


    function DeleteValue(address[] memory data,
        address value
    ) internal pure returns(address[] memory) {

        return removeByValue(data, value);
    }

    function UpdateValueByNew(address[] memory data,
        address oldValue,
        address newValue
    ) internal pure returns(address[] memory) {
        uint i = find(data, oldValue);
        data[i] = newValue;
        return data;
    }


// functions for Uint

    function ufind(
        uint[] memory data,
        uint value
    ) internal pure returns(uint) {
        uint i = 0;
        while (data[i] != value) {
            i++;
        }
        return i;
    }

    function uremoveByValue(
        uint[] memory data,
        uint value
    ) internal pure returns(uint[]memory) {
        uint i = ufind(data, value);
        return uremoveByIndex(data, i);
    }

    function uremoveByIndex(
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


    function uDeleteValue(
        uint[] memory data,
        uint value
    ) internal pure returns(uint[] memory) {

        return uremoveByValue(data, value);
    }

    function uUpdateValueByNew(
        uint[] memory data,
        uint oldValue,
        uint newValue
    ) internal pure returns(uint[] memory) {
        uint i = ufind(data, oldValue);

        data[i] = newValue;
        return data;
    }

}