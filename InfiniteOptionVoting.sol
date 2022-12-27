pragma solidity ^0.8.17;

// SPDX-License-Identifier: MIT

/**
 * @title Infinite Option Voting Contract
 * @author Elliot
 */
contract InfiniteOptionVoting {
    address public owner;
    string[] public options;
    bool public votingActive;
    mapping (uint => uint) public votes;
    uint public totalVotes;
    
    constructor() public {
        owner = msg.sender;
        votingActive = false;
    }
    
    function addOption(string memory option) public {
        require(msg.sender == owner, "Only the owner can add options");
        options.push(option);
    }
    
    function activateVoting() public {
        require(msg.sender == owner, "Only the owner can activate the voting");
        require(!votingActive, "The voting is already active");
        votingActive = true;
    }
    
    function deactivateVoting() public {
        require(msg.sender == owner, "Only the owner can deactivate the voting");
        require(votingActive, "The voting is already deactivated");
        votingActive = false;
    }
    
    function vote(uint optionIndex) public {
        require(votingActive, "The voting is not currently active");
        require(optionIndex < options.length, "Invalid option index");
        require(votes[optionIndex] == 0, "You have already voted");
        votes[optionIndex]++;
        totalVotes++;
    }
}
