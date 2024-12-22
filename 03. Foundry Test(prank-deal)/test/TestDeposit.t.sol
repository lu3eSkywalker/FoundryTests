// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Deposit} from "../src/Deposity.sol";

contract DepositTest is Test {
    Deposit d;

    function setUp() public {
        d = new Deposit();
    }

    function test_deposit() public {
        address ownerAccount = address(0x70997970C51812dc3A010C7d01b50e0d17dc79C8);
        uint256 balance = 100 ether;

        vm.deal(ownerAccount, balance);
        vm.prank(0x70997970C51812dc3A010C7d01b50e0d17dc79C8);
        d.deposit{value: 100 ether}();
    }
}