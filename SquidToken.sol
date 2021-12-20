pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";


contract Squid is ERC20, Ownable {

  string public name = "Squid Airdrop";
  string public symbol = "SQUID";

  constructor(
    string memory _name,
    string memory _symbol,
  ) ERC20(_name, _symbol) {
  }
}
