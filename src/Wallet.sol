pragma solidity ^0.8.17;

contract Wallet {
    address payable public owner;

    event Deposit(address account, uint256 amount);

    constructor() payable {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint256 _amount) external {
        require(msg.sender == owner, "Caller is not the owner");
        require(_amount <= address(this).balance);

        payable(msg.sender).transfer(_amount);
    }

    function setOwner(address _newOwner) external {
        require(msg.sender == owner, "Caller is not the owner");
        owner = payable(_newOwner);
    }
}