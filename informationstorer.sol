

// SPDX-License-Identifier: MIT

 ///  $$$$$$            /$$$$$$                                              /$$     /$$                            /$$$$$$   /$$                                            
//  |_  $$_/           /$$__  $$                                            | $$    |__/                           /$$__  $$ | $$                                            
  //  | $$   /$$$$$$$ | $$  \__//$$$$$$   /$$$$$$  /$$$$$$/$$$$   /$$$$$$  /$$$$$$   /$$  /$$$$$$  /$$$$$$$       | $$  \__//$$$$$$    /$$$$$$   /$$$$$$   /$$$$$$   /$$$$$$ 
  //  | $$  | $$__  $$| $$$$   /$$__  $$ /$$__  $$| $$_  $$_  $$ |____  $$|_  $$_/  | $$ /$$__  $$| $$__  $$      |  $$$$$$|_  $$_/   /$$__  $$ /$$__  $$ /$$__  $$ /$$__  $$
  //  | $$  | $$  \ $$| $$_/  | $$  \ $$| $$  \__/| $$ \ $$ \ $$  /$$$$$$$  | $$    | $$| $$  \ $$| $$  \ $$       \____  $$ | $$    | $$  \ $$| $$  \__/| $$$$$$$$| $$  \__/
  //  | $$  | $$  | $$| $$    | $$  | $$| $$      | $$ | $$ | $$ /$$__  $$  | $$ /$$| $$| $$  | $$| $$  | $$       /$$  \ $$ | $$ /$$| $$  | $$| $$      | $$_____/| $$      
 //  /$$$$$$| $$  | $$| $$    |  $$$$$$/| $$      | $$ | $$ | $$|  $$$$$$$  |  $$$$/| $$|  $$$$$$/| $$  | $$      |  $$$$$$/ |  $$$$/|  $$$$$$/| $$      |  $$$$$$$| $$      
//  |______/|__/  |__/|__/     \______/ |__/      |__/ |__/ |__/ \_______/   \___/  |__/ \______/ |__/  |__/       \______/   \___/   \______/ |__/       \_______/|__/      


//By BraverElliot.eth (send me your money)



pragma solidity ^0.8.7;

contract infomationStorer{

    address public owner;
    uint256 private counter;

    constructor()   {
        counter = 0;
        owner = msg.sender;
    }
    struct store    {
        address storer;
        uint256 id;
        string Fielda;
        string Fieldb;
    }

    event storeCreated   (
        address storer,
        uint256 id,
        string Fielda,
        string Fieldb
    );

    mapping(uint256 => store) Storers;    


    function addStore(

        string memory Fielda,
        string memory Fieldb
    ) public payable {
        require(msg.value ==  10000000000000000 wei, "Please submit 0.01 Eth"); //submit 0.01 eth for anti-spam protection
        store storage newStore = Storers[counter];
        newStore.Fielda = Fielda;
        newStore.Fieldb = Fieldb;
        newStore.storer = msg.sender;
        newStore.id = counter;


        emit storeCreated(
                msg.sender,
                counter,
                Fielda,
                Fieldb
            );

        counter++;

        payable(owner).transfer(msg.value);


    }

    function getInfo(uint256 id) public view returns(
            string memory,
            string memory,
            address
        ){
            require(id<counter, "No such Post");
            store storage t = Storers[id];
            return(t.Fielda,t.Fieldb,t.storer);
        }


}
