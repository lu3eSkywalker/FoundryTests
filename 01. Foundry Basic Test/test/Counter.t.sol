// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter c;

    function setUp() public {
        c = new Counter();
        c.setNumber(5);
    }

    function testInc() public {
        c.increment();
        c.increment();
        assertEq(c.getNum(), 7, "OK");
    }

    function testDec() public {
        c.decrement();
        c.decrement();
        assertEq(c.getNum(), 3, "OK");
    }

}