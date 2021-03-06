# IERC721AuctionFactoryFeature

A contract that deploys special ERC721 contracts for anyone.

## Functions

### createNFTAuction

```solidity
  function createNFTAuction(
    string urlName,
    struct IERC721FactoryCommon.NftMetadata nftMetadata,
    struct IERC721Auction.AuctionConfig auctionConfig,
    uint128 startTime,
    address owner
  ) external
```

Deploys a new ERC721Auction contract.

#### Parameters:

| Name            | Type                                    | Description                                                                                   |
| :-------------- | :-------------------------------------- | :-------------------------------------------------------------------------------------------- |
| `urlName`       | string                                  | The url name used by the frontend, kind of an id of the creator.                              |
| `nftMetadata`   | struct IERC721FactoryCommon.NftMetadata | The basic metadata of the NFT that will be created (name, symbol, ipfsHash, maxSupply).       |
| `auctionConfig` | struct IERC721Auction.AuctionConfig     | See {IERC721Auction-AuctionConfig}.                                                           |
| `startTime`     | uint128                                 | The unix timestamp at which the first auction starts. Current time if set to 0.               |
| `owner`         | address                                 | The owner address of the contract to be deployed. Will have special access to some functions. |

### getDeployedNFTAuctions

```solidity
  function getDeployedNFTAuctions(
    string urlName
  ) external returns (struct IFactoryFeature.DeployData[] nftAddresses)
```

Returns all the deployed ERC721Auction contract addresses by a specific creator.

#### Parameters:

| Name      | Type   | Description                                                      |
| :-------- | :----- | :--------------------------------------------------------------- |
| `urlName` | string | The url name used by the frontend, kind of an id of the creator. |

#### Return Values:

| Name           | Type   | Description                                |
| :------------- | :----- | :----------------------------------------- |
| `nftAddresses` | string | The requested array of contract addresses. |

### WETH

```solidity
  function WETH(
  ) external returns (address)
```

The address of the wrapped ether (or equivalent) contract.

## Events

### ERC721AuctionDeployed

```solidity
  event ERC721AuctionDeployed(
    address deployer,
    string urlName,
    address instance,
    uint96 factoryVersion
  )
```

Event emitted when creating a new ERC721Auction contract.

#### Parameters:

| Name             | Type    | Description                                                             |
| :--------------- | :------ | :---------------------------------------------------------------------- |
| `deployer`       | address | The address which created the contract.                                 |
| `urlName`        | string  | The urlName, where the created contract is sorted in.                   |
| `instance`       | address | The address of the newly created contract.                              |
| `factoryVersion` | uint96  | The version number of the factory that was used to deploy the contract. |
