// SPDX-License-Identifier: Apache-2.0

/*

  The file has been modified.
  2022 token.xyz

*/

/*

  Copyright 2020 ZeroEx Intl.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

*/

pragma solidity ^0.8.0;

import "./features/interfaces/IOwnableFeature.sol";
import "./features/interfaces/ISimpleFunctionRegistryFeature.sol";
import "./features/interfaces/IMulticallFeature.sol";
import "./features/interfaces/ITokenFactoryFeature.sol";
import "./features/interfaces/ITokenWithRolesFactoryFeature.sol";
import "./features/interfaces/IMerkleDistributorFactoryFeature.sol";
import "./features/interfaces/IMerkleVestingFactoryFeature.sol";
import "./features/interfaces/IMerkleNFTMinterFactoryFeature.sol";
import "./features/interfaces/IERC721CurveFactoryFeature.sol";

/// @title Interface for a fully featured token.xyz proxy.
interface ITokenXyz is
    IOwnableFeature,
    ISimpleFunctionRegistryFeature,
    IMulticallFeature,
    ITokenFactoryFeature,
    ITokenWithRolesFactoryFeature,
    IMerkleDistributorFactoryFeature,
    IMerkleVestingFactoryFeature,
    IMerkleNFTMinterFactoryFeature,
    IERC721CurveFactoryFeature
{
    /// @notice Error thrown when the requested function is not found in any features.
    /// @param selector The function's selector that was attempted to be called.
    error NotImplemented(bytes4 selector);

    /// @notice Fallback for just receiving ether.
    receive() external payable;
}
