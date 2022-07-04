// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Split{
    function tight(uint256 num) public  pure returns(uint256){
        require (num < 30,"should be < 30 & > 20");
        require(num > 20, "should be < 30 & > 20");
        return num;
    }
}