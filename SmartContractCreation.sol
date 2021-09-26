//First thing you EVER need in any solidity program is the solidity version. This will always be at the top of the solidity code. In this case I am using anything within .0.6.6 solidity version

SPDX-License-Identifier: MIT //this is to ensure the community has visibility to the license identifier means anyone can use this code and we do not mind
pragma solidity >=0.6.0 <0.9.0;
/*
High Level Context
- pragma solidity >=0.6.0 <0.9.0; (this will return a version of solidity between the range of the versions identified)
- pragma solidity ^0.6.0 (code run to allow us to run any sol version with 0.6 all the way up to 0.7)
- shortcut Hitting CTRL S on windows or CMD S on mac will automatically compile the code for us

Solidity 101 context:
- below code will define our contract. contract key word in sol is similar to a "class" in java or any other object oriented coding language. 
- way syntax works for defining variables is TYPE // VISIBILITY // THEN NAME
- Curly brackets represent the contents of our contract simple SimpleStorage

- In solidity you can have many different types and declaring variables. Examples of types include:
    -  integers/whole numbers
        - (uint) - unsigned integer meaning they are not positive or negative)
            - Example would be you could assign a variable such as uint256 favoriteNumber = 5; which would be uint which is integer up to 256 bits. Be more precise by using the whole name like uint256
        - (int) - usage when assigning positive or negative integer
            - Example int256 favoriteInt = -5;
        
    -booleans (true or false)
        Example = bool favortieBool  = true; but this could sldo be false
    
    -Strings
        - Example string favoriteString = "String";
    
    - Address (some time of etherium address - i am using my sample address from Metamask)
        - Example address favortieAddress = 0x5A2551123338797f37907cfD5B214D9c6474bcBA;
    
    - bytes object 
        - Example bytes32 favoriteBytes = "cat"; ---which means there are 32 bytes in variable favoriteBytes in this case we used a string that can be converted to bytes object. Max size is bytes32
*/

//lets assume for our storage we only want to store numbers, nothing else



contract SimpleStorage {
    
    //this will get initialized to 0!
    uint256 favoriteNumber;
    
    struct People{
        uint256 favoriteNumber;
        string name;
    }
    
      //array is a way of storing a list of an object or type. below is example of dynamic array if you want to change the size of the ray identify a number within the array []
    
    People[] public people;
    mapping (string => uint256) public nameToFavoriteNumber;
    
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    // view, pure - view functions just allow us to read off the blockchain but not make a state transaction. The buttons on the deployed contracts show as blue because they are view functions
    // pure functions do some type of math
    
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
    
    //memory means only stored during the execution of the function or contract call. Whereas storage will persist after that function executes.
    //memory = after execution delete the variable
    //storage = keep it forever
    
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
    
    
}

/*
Visiblity keywords:
- public functions can be called by anyone including variable to just look at them and return whatever that vartiable is
- external functions can only be called by contracts that are external to this contracts
- internal functions can only be called by other functions inside of this contract or derived contract, by not defining this is the default
- private functions are the most restrictive, only available for contracts they are defined in

public keyword defines visiblity of the variable or function


structs are ways to define new types in solidity almost like creating new objects. Below sample generates list for one person
    
    struct People{
        uint256 favoriteNumber;
        string name;
    }
    
    People public person = People({favoriteNumber: 2, name:"Joseph M"});
    
    To deploy and run - change env to injected web3 and allow hookup to Metamask
    */