# ERC721AuctionFactoryFeature

A contract that deploys special ERC721 contracts for anyone.

## Functions

### constructor

```solidity
  constructor(
    address weth
  )
```

Sets WETH address.

#### Parameters:

| Name   | Type    | Description                                                            |
| :----- | :------ | :--------------------------------------------------------------------- |
| `weth` | address | The address of wrapped ether on the chain the contract is deployed to. |

### migrate

```solidity
  function migrate(
  ) external returns (bytes4 success)
```

Initialize and register this feature. Should be delegatecalled by `Migrate.migrate()`.

#### Return Values:

| Name      | Type | Description                      |
| :-------- | :--- | :------------------------------- |
| `success` |      | `LibMigrate.SUCCESS` on success. |

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

## State variables

```solidity
  string FEATURE_NAME;

  uint96 FEATURE_VERSION;

  address WETH;
```
