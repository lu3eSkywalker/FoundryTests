// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Dogecoin} from "../src/ERC20Token.sol";

contract DogecoinTest is Test {
    Dogecoin c;
    event TokenTransfer(address indexed from, address indexed to, uint256 amount);
    event AllowanceApproval(address indexed spender, uint256 value);

    function setUp() public {
        c = new Dogecoin();
    }

    function test_EmitEvent() public {
        c.mint(address(this), 1000);

        vm.expectEmit(true, true, false, true);
        emit TokenTransfer(address(this), 0x70997970C51812dc3A010C7d01b50e0d17dc79C8, 100);

        c.transferToken(0x70997970C51812dc3A010C7d01b50e0d17dc79C8, 100);
    }

    function test_EmitApprove() public {
        c.mint(address(this), 1000);

        vm.expectEmit(true, true, false, true);
        emit AllowanceApproval(0x70997970C51812dc3A010C7d01b50e0d17dc79C8, 100);

        c.approveToken(0x70997970C51812dc3A010C7d01b50e0d17dc79C8, 100);
    }
}