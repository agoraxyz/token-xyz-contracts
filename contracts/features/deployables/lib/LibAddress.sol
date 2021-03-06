// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../interfaces/IWETH.sol";

/// @title Library for functions related to addresses.
library LibAddress {
    /// @notice Error thrown when sending ether fails.
    /// @param recipient The address that could not receive the ether.
    error FailedToSendEther(address recipient);

    /// @notice Send ether to an address, forwarding all available gas and reverting on errors.
    /// @param recipient The recipient of the ether.
    /// @param amount The amount of ether to send in wei.
    function sendEther(address payable recipient, uint256 amount) internal {
        // solhint-disable-next-line avoid-low-level-calls
        (bool success, ) = recipient.call{ value: amount }("");
        if (!success) revert FailedToSendEther(recipient);
    }

    /// @notice Similar to {sendEther}, but converts the value to `fallbackToken` and sends it anyways on failure.
    /// @param recipient The recipient of the ether.
    /// @param amount The amount of ether to send in wei.
    /// @param fallbackToken A token compatible with WETH's interface.
    function sendEtherWithFallback(
        address payable recipient,
        uint256 amount,
        address fallbackToken
    ) internal {
        // solhint-disable-next-line avoid-low-level-calls
        (bool success, ) = recipient.call{ value: amount }("");
        if (!success) {
            IWETH(fallbackToken).deposit{ value: amount }();
            IWETH(fallbackToken).transfer(recipient, amount);
        }
    }
}
