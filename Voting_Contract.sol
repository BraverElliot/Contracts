pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT

/**
 * @title Voting Contract
 * @author Elliot
 */
contract Voting {
    address public owner;

    uint256 public OptionACount = 0;
    uint256 public OptionBCount = 0;
    uint256 public TotalVotes = 0;

    bool public isOpen;

    mapping(address => bool) public hasVoted;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function openVoting() public onlyOwner {
        isOpen = true;
    }

    function closeVoting() public onlyOwner {
        isOpen = false;
    }

    function voteOptionA() public {
        require(hasVoted[msg.sender] != true, "user has already voted");
        require(isOpen, "voting is closed");
        OptionACount += 1;
        TotalVotes += 1;
    }

    function voteOptionB() public {
        require(hasVoted[msg.sender] != true, "user has already voted");
        require(isOpen, "voting is closed");

        OptionBCount += 1;
        TotalVotes += 1;
    }
}
