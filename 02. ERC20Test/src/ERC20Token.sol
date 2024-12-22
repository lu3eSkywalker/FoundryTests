// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Dogecoin is ERC20, Ownable {

    event TokenTransfer(address indexed from, address indexed to, uint256 value);
    event AllowanceApproval(address indexed spender, uint256 value);

    constructor() ERC20("Dogecoin", "DOGE") Ownable(msg.sender) {
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function returnAccountBalance(address userAddress) public view returns(uint256) {
        return balanceOf(userAddress);
    }


    function transferToken(address to, uint256 value) public {
        transfer(to, value);
        emit TokenTransfer(msg.sender, to, value);
    }

    function approveToken(address spender, uint256 value) public {
        approve(spender, value);

        emit AllowanceApproval(spender, value);
    }

    function checkAllowance(address owner, address spender) public view returns(uint256) {
        return allowance(owner, spender);
    }

    function allowanceTransferFrom(address from, address to, uint256 value) public {
        transferFrom(from, to, value);
    }
}