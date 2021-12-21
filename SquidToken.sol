pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

import "./TestBSCPompave.sol";


contract Squid is ERC20, Ownable {

  Ponpave ERC721ToAirDrop = Ponpave(0x66416C5232dBAa757BaA974Dd1C3c8EC77C9143B);

  uint256 private _decimals = 1000000000000000000;
  uint256 private _airdropAmount = 10;
  uint256 private _totalSupply = 50000;

  constructor(
    string memory _name,
    string memory _symbol
  ) ERC20(_name, _symbol) {
  }

  function setAddressERC721(address _address) public onlyOwner {
    ERC721ToAirDrop = Ponpave(_address);
  }

  function getSupplyOfERC721() public view returns (uint256) {
    return ERC721ToAirDrop.totalSupply();
  }

  function getAddressOfId(uint256 _tokenId) public view returns (address) {
    return ERC721ToAirDrop.ownerOf(_tokenId);
  }

  function airDropToUser(address _user, uint256 _amount) public onlyOwner {
    ERC20._mint(_user, _amount * _decimals);
  }

  function airDropToAllUSer() public onlyOwner {
    uint256  _currentSupply;
    uint256 j = 1;
    address _ownerOfTokenJ;

    _currentSupply = getSupplyOfERC721();


    for (j = 1; j <= _currentSupply ; j++) {
      _ownerOfTokenJ = getAddressOfId(j);
      airDropToUser(_ownerOfTokenJ, _airdropAmount);
    }

  }

}
