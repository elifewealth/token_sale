pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol';
import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Mintable.sol';
import "./DappToken.sol";

contract DappTokenSale is ERC721Full, ERC721Mintable {
    constructor() ERC721Full("DappTokenSale", "DTS") public {
        address admin;
        DappToken public tokenContract;
        uint256 public tokenPrice;
        uint256 public tokensSold;

        event Sell(address _buyer, uint256 _amount);

        function DappTokenSale(DappToken _tokenContract, uint256 _tokenPrice) public {
            admin = msg.sender;
            tokenContract = _tokenContract;
            tokenPrice = _tokenPrice;
        }

        function multiply(uint x, uint y) internal pure returns (uint z) {
            require(y == 0 || (z = x * y) / y == x);
        }

        function buyTokens(uint256 _numberOfTokens) public payable {
            require(msg.value == multiply(_numberOfTokens, tokenPrice));
            require(tokenContract.balanceOf(this) >= _numberOfTokens);
            require(tokenContract.transfer(msg.sender, _numberOfTokens));

            tokensSold += _numberOfTokens;

            Sell(msg.sender, _numberOfTokens);
        }

        function endSale() public {
            require(msg.sender == admin);
            require(tokenContract.transfer(admin, tokenContract.balanceOf(this)));

            // UPDATE: Let's not destroy the contract here
            // Just transfer the balance to the admin
            admin.transfer(address(this).balance);
        }
    }
}
