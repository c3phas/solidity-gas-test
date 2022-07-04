// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Notsplit.sol";

contract NotsplitTest is Test {
    Notsplit notsplit;

    function setUp() public {
      notsplit = new Notsplit();
    }

    function testtight() public {
        uint256 num = 19;
        assertEq(notsplit.tight(num), num, "Not equal");
    }
}
