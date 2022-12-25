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

    mapping(address => bool) public hasVoted;

    function voteOptionA () public {
        require(hasVoted[msg.sender] != true, "user has already voted");
        OptionACount+=1;
        TotalVotes+=1;
    }
    function voteOptionB () public {
        require(hasVoted[msg.sender] != true, "user has already voted");
        OptionBCount+=1;
        TotalVotes+=1;
    }
}
