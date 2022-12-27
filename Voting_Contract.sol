pragma solidity ^0.8.7;

// SPDX-License-Identifier: MIT

/**
 * @title Voting Contract
 * @author Elliot
 */
contract Voting {

    uint256 public OptionACount = 0;
    uint256 public OptionBCount = 0;
    uint256 public TotalVotes = 0;

    bool public isOpen;

    mapping(address => bool) public hasVoted;



    function openVoting () public {
        isOpen = true;
    }

    function closeVoting () public {
        isOpen = false;
    }

    function voteOptionA () public {
        require(hasVoted[msg.sender] != true, "user has already voted");
        require(isOpen, "voting is closed");


        hasVoted[msg.sender] = false;

        OptionACount+=1;
        TotalVotes+=1;
    }
    function voteOptionB () public {
        require(hasVoted[msg.sender] != true, "user has already voted");
        require(isOpen, "voting is closed");


        hasVoted[msg.sender] = false;


        OptionBCount+=1;
        TotalVotes+=1;
    }
}
