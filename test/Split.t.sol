// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Split.sol";

contract SplitTest is Test {
    Split  split;
    
    function setUp() public {
        split = new Split();
    }

    function testtight() public {
        uint256 num = 19;
        assertEq(split.tight(num), num, "Should have set fee");
    }
}
