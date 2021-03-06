// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import { IERC721Metadata } from "@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol";

/// @title An NFT with an ever increasing price along a curve.
interface IERC721Curve is IERC721Metadata {
    /// @notice Claims a token to the given address. Reverts if the price is invalid.
    function claim(address payable claimer) external payable;

    /// @notice Sends the collected funds to `recipient`. Callable only by the owner.
    /// @param recipient The address receiving the tokens.
    function withdraw(address payable recipient) external;

    /// @notice Gets the price of a specific token.
    /// @param tokenId The ID of the token.
    /// @return price The price of the token in wei.
    function getPriceOf(uint256 tokenId) external view returns (uint256 price);

    /// @notice The maximum number of NFTs that can ever be minted.
    /// @return count The number of NFTs.
    function maxSupply() external view returns (uint256 count);

    /// @notice The price of the first token.
    /// @return price The price in wei.
    function startingPrice() external view returns (uint256 price);

    /// @notice The total amount of tokens stored by the contract.
    /// @return count The number of NFTs.
    function totalSupply() external view returns (uint256 count);

    /// @notice This event is triggered whenever a call to {withdraw} succeeds.
    /// @param account The address that received the tokens.
    /// @param amount The amount of tokens the address received.
    event Withdrawn(address account, uint256 amount);

    /// @notice Error thrown when there's nothing to withdraw.
    error AlreadyWithdrawn();

    /// @notice Error thrown when a function receives invalid parameters.
    error InvalidParameters();

    /// @notice Error thrown when the maximum supply attempted to be set is zero.
    error MaxSupplyZero();

    /// @notice Error thrown when trying to query info about a token that's not (yet) minted.
    /// @param tokenId The queried id.
    error NonExistentToken(uint256 tokenId);

    /// @notice Error thrown when the transaction value is lower than the price of the token.
    /// @param paid The amount paid in wei.
    /// @param nextPrice The price of the next token in wei.
    error PriceTooLow(uint256 paid, uint256 nextPrice);

    /// @notice Error thrown when the starting price attempted to be set is zero.
    error StartingPriceZero();

    /// @notice Error thrown when the tokenId is higher than the maximum supply.
    /// @param tokenId The id that was attempted to be used.
    /// @param maxSupply The maximum supply of the token.
    error TokenIdOutOfBounds(uint256 tokenId, uint256 maxSupply);
}
