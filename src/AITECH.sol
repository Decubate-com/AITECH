// SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract AITECH is ERC20, Ownable, ERC20Burnable {
    constructor() ERC20("AITECH", "AITECH") {
        // Mint 2 billion tokens
        _mint(msg.sender, 2000000000 * 10 ** 18);
    }
}
