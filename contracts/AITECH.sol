// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract AITECH is ERC20, Ownable, AccessControl, ERC20Burnable {

    // Create a new role identifier for the minter role
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    // Create a new role identifier for the burner role
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

    constructor() ERC20("AITECH", "AITECH") {

        // Grant the contract deployer the default admin role: it will be able
        // to grant and revoke any roles
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);

        // Grant the minter role to a specified account
        _setupRole(MINTER_ROLE, msg.sender);

        // Grant the burner role to a specific account
        _setupRole(BURNER_ROLE, msg.sender);
    }

    // This function uses the virtual _mint() function
    // it can be called by the MINTER_ROLE
    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    // This function overrides the burn() function from the ERC20Burnable extension
    // it can be called by the BURNER_ROLE
    function burn(uint256 amount) public override onlyRole(BURNER_ROLE){
        _burn(_msgSender(), amount);
    }

    // This function overrides the burnFrom() function from the ERC20Burnable extension
    // it can be called by the BURNER_ROLE
    function burnFrom(address account, uint256 amount) public override onlyRole(BURNER_ROLE){
        _spendAllowance(account, _msgSender(), amount);
        _burn(account, amount);
    }

}