// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Dogecoin} from "../src/ERC20Token.sol";

contract DogecoinTest is Test {
    Dogecoin c;

    function setUp() public {
        c = new Dogecoin();
    }

    function testMintFunction() public {
        c.mint(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, 10);
        assertEq(c.returnAccountBalance(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266), 10, "OK");
    }

    function testMintTokensToTestAddress() public {
        c.mint(address(this), 10);
        c.transferToken(0x70997970C51812dc3A010C7d01b50e0d17dc79C8, 5);
        assertEq(c.returnAccountBalance(0x70997970C51812dc3A010C7d01b50e0d17dc79C8), 5, "OK");
    }

    function testApproveTokens() public {
        address contractOwner = address(this);
        c.mint(contractOwner, 10);
        c.approveToken(0x70997970C51812dc3A010C7d01b50e0d17dc79C8, 5);
        assertEq(c.checkAllowance(contractOwner, 0x70997970C51812dc3A010C7d01b50e0d17dc79C8), 5, "OK");
        vm.prank(0x70997970C51812dc3A010C7d01b50e0d17dc79C8);
        c.allowanceTransferFrom(contractOwner, 0xa0Ee7A142d267C1f36714E4a8F75612F20a79720, 2);
        assertEq(c.returnAccountBalance(0xa0Ee7A142d267C1f36714E4a8F75612F20a79720), 2, "OK");
    }

    // Negative Tests

    function testFail_NoBalanceTokenTransfer() public {
        vm.prank(0x70997970C51812dc3A010C7d01b50e0d17dc79C8);
        c.transferToken(0xa0Ee7A142d267C1f36714E4a8F75612F20a79720, 5);
    }

    function testFail_TokenTransferWithoutApproval() public {
        vm.prank(0x70997970C51812dc3A010C7d01b50e0d17dc79C8);
        c.allowanceTransferFrom(address(this), 0x70997970C51812dc3A010C7d01b50e0d17dc79C8, 100);
    }
}