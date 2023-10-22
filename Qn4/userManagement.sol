// SPDX-License-Identifier: MIT
pragma solidity^0.8.0;

contract userInfo{

    address private owner;

    constructor() {
        owner = msg.sender;
    }

    event AuthenticationResult(bool success);  
    event UserInfoUpdated(string username,string password, uint256 adhaarNo, uint256 age, string name, address walletAddress);
 

    
    struct info{
        string username;
        string password;
        uint256 adhaarNo;
        uint256 age;
        string name;
        address walletAddress;
    }
    info[] private userDetail;

    function addDetails(string memory _username, string memory _password,uint _adhaarNo, uint256 _age, string memory _name, address _walletAddress)public{
        require(msg.sender == owner, "Only the owner can add user credentials.");
        userDetail.push(info(_username,_password,_adhaarNo,_age,_name,_walletAddress));
        emit UserInfoUpdated(_username, _password, _adhaarNo, _age, _name, _walletAddress);
    }

    function viewDetails(string memory _username,string memory _password)public view returns(string memory,string memory, string memory, string memory, address){
        for(uint256 i=0; i<userDetail.length; i++){
            if(keccak256(abi.encodePacked(userDetail[i].username)) == keccak256(abi.encodePacked(_username)) && (keccak256(abi.encodePacked(userDetail[i].password)) == keccak256(abi.encodePacked(_password)))){
                return(
                    "Welcome!",
                    string(abi.encodePacked("Adaahar Number:",uint256ToString(userDetail[i].adhaarNo))),
                    string(abi.encodePacked("Age:",uint256ToString(userDetail[i].age))),
                    string(abi.encodePacked("Name:",userDetail[i].name)),
                    userDetail[i].walletAddress
                );
            }}

        return ("You are not registerd with us :(","", "", "", address(0));
    }
    function uint256ToString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            buffer[--digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
}
}