# TokenWithRolesFactoryFeature

A contract that deploys ERC20 token contracts with OpenZeppelin's AccessControl for anyone.

## Functions

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

### createTokenWithRoles

```solidity
  function createTokenWithRoles(
    string urlName,
    string tokenName,
    string tokenSymbol,
    uint8 tokenDecimals,
    uint256 initialSupply,
    uint256 maxSupply,
    address firstOwner
  ) external
```

Deploys a new ERC20 token contract.

#### Parameters:

| Name            | Type    | Description                                                                                    |
| :-------------- | :------ | :--------------------------------------------------------------------------------------------- |
| `urlName`       | string  | The url name used by the frontend, kind of an id of the creator.                               |
| `tokenName`     | string  | The token's name.                                                                              |
| `tokenSymbol`   | string  | The token's symbol.                                                                            |
| `tokenDecimals` | uint8   | The token's number of decimals.                                                                |
| `initialSupply` | uint256 | The initial amount of tokens to mint.                                                          |
| `maxSupply`     | uint256 | The maximum amount of tokens that can ever be minted. Unlimited if set to zero.                |
| `firstOwner`    | address | The address to assign ownership/minter role to (if mintable). Recipient of the initial supply. |

### getDeployedTokens

```solidity
  function getDeployedTokens(
    string urlName
  ) external returns (struct IFactoryFeature.DeployData[] tokenAddresses)
```

Returns all the deployed token addresses by a specific creator.

#### Parameters:

| Name      | Type   | Description                                                      |
| :-------- | :----- | :--------------------------------------------------------------- |
| `urlName` | string | The url name used by the frontend, kind of an id of the creator. |

#### Return Values:

| Name             | Type   | Description                              |
| :--------------- | :----- | :--------------------------------------- |
| `tokenAddresses` | string | The requested array of tokens addresses. |

## State variables

```solidity
  string FEATURE_NAME;

  uint96 FEATURE_VERSION;
```
