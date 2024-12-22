// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Admin} from "../src/Admin.sol";

contract AdminTest is Test {
    Admin a;

    function setUp() public {
        a = new Admin(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
    }

    function test_AdminChangeWithPrank() public {
        vm.prank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        a.changeAdmin(0x70997970C51812dc3A010C7d01b50e0d17dc79C8);
    }

    function test_AdminChangeWithoutPrank() public {
        a.changeAdmin(0x70997970C51812dc3A010C7d01b50e0d17dc79C8);
    }
}