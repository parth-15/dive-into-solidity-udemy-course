//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
       require(msg.sender == owner, "ONLY_OWNER");
       _;
    }

    function changeTokens() public {
        string[] storage t = tokens;
        t[0] = "VET";
    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }

    function transferAll(address to) onlyOwner() public {
        (bool success, ) = to.call{value: address(this).balance}("");
        require(success);
    }

    function start() public {
        players.push(msg.sender);
    }

    function concatenate(string calldata s1, string calldata s2) pure public returns(string memory) {
        string memory concatenatedString = string(abi.encodePacked(s1, s2));
        return concatenatedString;
    }

    receive() external payable {

    }
}
