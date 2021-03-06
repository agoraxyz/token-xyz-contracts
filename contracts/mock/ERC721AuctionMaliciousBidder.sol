// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IERC721Auction } from "../features/deployables/interfaces/IERC721Auction.sol";

/// @title A bidder for ERC721Auction that cannot receive ether.
/// @dev The inability to receive ether would make it impossible to outbid it... or wouldn't?
contract ERC721AuctionMaliciousBidder {
    IERC721Auction public auctionContract;

    /// @notice Sets the address of an ERC721 auction contract.
    /// @param auction The address of an ERC721 auction contract.
    constructor(IERC721Auction auction) {
        auctionContract = auction;
    }

    /// @notice Calls bid on the auction contract.
    /// @param tokenId The tokenId to bid on.
    function bid(uint256 tokenId) external payable {
        auctionContract.bid{ value: msg.value }(tokenId);
    }
}
