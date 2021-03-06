// SPDX-License-Identifier: GPL-3.0-or-later

/*

  The file has been modified.
  2022 token.xyz

*/

pragma solidity ^0.8.0;

/// @title Provides ERC20 token distribution based on a Merkle tree.
interface IMerkleDistributor {
    /// @notice Returns the address of the token distributed by this contract.
    /// @return tokenAddress The address of the token.
    function token() external view returns (address tokenAddress);

    /// @notice Returns the Merkle root of the Merkle tree containing account balances available to claim.
    /// @return root The root hash of the Merkle tree.
    function merkleRoot() external view returns (bytes32 root);

    /// @notice Returns the unix timestamp that marks the end of the token distribution.
    /// @return unixSeconds The unix timestamp in seconds.
    function distributionEnd() external view returns (uint256 unixSeconds);

    /// @notice Returns true if the index has been marked claimed.
    /// @param index A value from the generated input list.
    /// @return claimed Whether the tokens from `index` have been claimed.
    function isClaimed(uint256 index) external view returns (bool claimed);

    /// @notice Claim the given amount of the token to the given address. Reverts if the inputs are invalid.
    /// @param index A value from the generated input list.
    /// @param account A value from the generated input list.
    /// @param amount A value from the generated input list.
    /// @param merkleProof An array of values from the generated input list.
    function claim(
        uint256 index,
        address account,
        uint256 amount,
        bytes32[] calldata merkleProof
    ) external;

    /// @notice Prolongs the distribution period of the tokens. Callable only by the owner.
    /// @param additionalSeconds The seconds to add to the current distributionEnd.
    function prolongDistributionPeriod(uint256 additionalSeconds) external;

    /// @notice Sends the tokens remaining after the distribution has ended to `recipient`. Callable only by the owner.
    /// @param recipient The address receiving the tokens.
    function withdraw(address recipient) external;

    /// @notice This event is triggered whenever a call to {claim} succeeds.
    /// @param index A value from the generated input list.
    /// @param account A value from the generated input list.
    /// @param amount A value from the generated input list.
    event Claimed(uint256 index, address account, uint256 amount);

    /// @notice This event is triggered whenever a call to {prolongDistributionPeriod} succeeds.
    /// @param newDistributionEnd The time when the distribution ends.
    event DistributionProlonged(uint256 newDistributionEnd);

    /// @notice This event is triggered whenever a call to {withdraw} succeeds.
    /// @param account The address that received the tokens.
    /// @param amount The amount of tokens the address received.
    event Withdrawn(address account, uint256 amount);

    /// @notice Error thrown when there's nothing to withdraw.
    error AlreadyWithdrawn();

    /// @notice Error thrown when the distribution period ended.
    /// @param current The current timestamp.
    /// @param end The time when the distribution ended.
    error DistributionEnded(uint256 current, uint256 end);

    /// @notice Error thrown when the distribution period did not end yet.
    /// @param current The current timestamp.
    /// @param end The time when the distribution ends.
    error DistributionOngoing(uint256 current, uint256 end);

    /// @notice Error thrown when the drop is already claimed.
    error AlreadyClaimed();

    /// @notice Error thrown when a function receives invalid parameters.
    error InvalidParameters();

    /// @notice Error thrown when the Merkle proof is invalid.
    error InvalidProof();

    /// @notice Error thrown when a transfer failed.
    /// @param token The address of token attempted to be transferred.
    /// @param from The sender of the token.
    /// @param to The recipient of the token.
    error TransferFailed(address token, address from, address to);
}
