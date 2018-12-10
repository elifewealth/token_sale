pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol';
import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Mintable.sol';

contract Migrations is ERC721Full, ERC721Mintable {
  constructor() ERC721Full("Migrations", "MIG") public {
    address public owner;
    uint public last_completed_migration;

    constructor() public {
      owner = msg.sender;
    }

    modifier restricted() {
      if (msg.sender == owner) _;
    }

    function setCompleted(uint completed) public restricted {
      last_completed_migration = completed;
    }

    function upgrade(address new_address) public restricted {
      Migrations upgraded = Migrations(new_address);
      upgraded.setCompleted(last_completed_migration);
    }
  }
}
