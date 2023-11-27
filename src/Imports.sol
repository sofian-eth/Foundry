pragma solidity ^0.8.17;

import "solmate/tokens/ERC20.sol";

contract Token is ERC20("TokenTokenToken", "TTT", 18) {}

import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract TokenOwnable is Ownable {}
