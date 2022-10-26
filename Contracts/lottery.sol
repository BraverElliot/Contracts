pragma solidity ^0.4.17;
    
  contract Lottery {
      address public organizer;
      address[] public players;
      address public latestWinner;
        
      function Raffle() public{
          organizer = msg.sender;
      }
       
      function enter() public payable{
          require(msg.value > .01 ether);
          players.push(msg.sender);
      }
       
      function random() private view returns(uint){
        return uint(keccak256(block.difficulty, now, players));
      }
       
      function pickWinner() public returns(address){
          uint index = random() % players.length;
          players[index].transfer(this.balance);
          latestWinner = players[index];
      }
  }
