pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import {Event} from "../src/Event.sol";

contract EventTest is Test {
    Event public e;

    event Transfer(address indexed from, address indexed to, uint256 amount);

    function setUp() public {
        e = new Event();
    }

    function testEmitTransferEvent() public {

        vm.expectEmit(true, true, false, true);

        emit Transfer(address(this), address(1), 786);

        e.transfer(address(this), address(1), 786);
    }

    function testEmitManyTransferEvent() public {
        address[] memory to = new address[](2);
        to[0] = address(1);
        to[1] = address(2);

        uint256[] memory amount = new uint256[](2);
        amount[0] = 123;
        amount[1] = 321;

        for(uint256 i = 0; i < to.length; i++) {
            vm.expectEmit(true, true, false, true);
            emit Transfer(address(this), to[i], amount[i]);
        }

        e.transferMany(address(this), to, amount);
    }
}