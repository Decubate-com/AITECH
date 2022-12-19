// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

import "forge-std/Test.sol";
import { AITECH } from "../src/AITECH.sol";

contract AITECHTest is Test {
    AITECH internal aitech;

    uint256 totalSupply;

    function setUp() public {
        aitech = new AITECH();
    }

    function testTotalSupply() external {
        // get the total supply from AITECH token
        totalSupply = aitech.totalSupply();

        // check whether the supply is 2 billion
        assertEq(totalSupply, 2000000000 * 10 ** 18);
    }
}
