// SPDX-License-Identifier: MIT

pragma solidity ^0.7.6;

contract HelloWorld {
    mapping(address => string) public users;

    function call_hello() public pure returns (string memory) {
        return "Hello, Optimism!";
    }

    function send_hello(string memory _username) public returns (string memory) {
        users[msg.sender] = _username;
        return string(abi.encodePacked("Hello, ", _username, "!"));
    }

    function whoami() public view returns (string memory) {
        return string(abi.encodePacked("Hello, ", users[msg.sender], "!"));
    }
}