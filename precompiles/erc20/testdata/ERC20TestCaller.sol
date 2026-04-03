// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.20;

import "../ERC20I.sol" as erc20Precompile;

/// @dev Contract for testing the Evmos ERC20 precompile.
contract ERC20TestCaller {
    erc20Precompile.ERC20I public token;

    constructor(address tokenAddress) {
        token = erc20Precompile.ERC20I(tokenAddress);
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        return token.transfer(to, amount);
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        return token.approve(spender, amount);
    }

    function transferFrom(address from, address to, uint256 amount) external returns (bool) {
        return token.transferFrom(from, to, amount);
    }

    function testCallerWithoutFunds(address to, uint256 amount) external returns (bool) {
        return token.transfer(to, amount);
    }
}
