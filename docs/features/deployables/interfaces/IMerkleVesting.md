# IMerkleVesting

Provides ERC20 token distribution over time, based on a Merkle tree.

## Functions

### token

```solidity
  function token(
  ) external returns (address tokenAddress)
```

Returns the address of the token distributed by this contract.

#### Return Values:

| Name           | Type | Description               |
| :------------- | :--- | :------------------------ |
| `tokenAddress` |      | The address of the token. |

### allCohortsEnd

```solidity
  function allCohortsEnd(
  ) external returns (uint256 unixSeconds)
```

Returns the timestamp when all cohorts' distribution period ends.

#### Return Values:

| Name          | Type | Description                    |
| :------------ | :--- | :----------------------------- |
| `unixSeconds` |      | The unix timestamp in seconds. |

### getCohort

```solidity
  function getCohort(
    uint256 cohortId
  ) external returns (bytes32 merkleRoot, uint64 distributionStart, uint64 distributionEnd, uint64 vestingPeriod, uint64 cliffPeriod)
```

Returns the parameters of a specific cohort.

#### Parameters:

| Name       | Type    | Description           |
| :--------- | :------ | :-------------------- |
| `cohortId` | uint256 | The id of the cohort. |

#### Return Values:

| Name                | Type    | Description                                                        |
| :------------------ | :------ | :----------------------------------------------------------------- |
| `merkleRoot`        | uint256 | The Merkle root of the cohort.                                     |
| `distributionStart` |         | The unix timestamp that marks the start of the token distribution. |
| `distributionEnd`   |         | The unix timestamp that marks the end of the token distribution.   |
| `vestingPeriod`     |         | The length of the vesting period in seconds.                       |
| `cliffPeriod`       |         | The length of the cliff period in seconds.                         |

### getCohortsLength

```solidity
  function getCohortsLength(
  ) external returns (uint256 count)
```

Returns the number of created cohorts.

#### Return Values:

| Name    | Type | Description                    |
| :------ | :--- | :----------------------------- |
| `count` |      | The number of created cohorts. |

### getClaimableAmount

```solidity
  function getClaimableAmount(
    uint256 cohortId,
    uint256 index,
    address account,
    uint256 fullAmount
  ) external returns (uint256 amount)
```

Returns the amount of funds an account can claim at the moment.

#### Parameters:

| Name         | Type    | Description                                     |
| :----------- | :------ | :---------------------------------------------- |
| `cohortId`   | uint256 | The id of the cohort.                           |
| `index`      | uint256 | A value from the generated input list.          |
| `account`    | address | The address of the account to query.            |
| `fullAmount` | uint256 | The full amount of funds the account can claim. |

#### Return Values:

| Name     | Type    | Description                  |
| :------- | :------ | :--------------------------- |
| `amount` | uint256 | The amount of tokens in wei. |

### getClaimed

```solidity
  function getClaimed(
    uint256 cohortId,
    address account
  ) external returns (uint256 amount)
```

Returns the amount of funds an account has claimed.

#### Parameters:

| Name       | Type    | Description                          |
| :--------- | :------ | :----------------------------------- |
| `cohortId` | uint256 | The id of the cohort.                |
| `account`  | address | The address of the account to query. |

#### Return Values:

| Name     | Type    | Description                  |
| :------- | :------ | :--------------------------- |
| `amount` | uint256 | The amount of tokens in wei. |

### isDisabled

```solidity
  function isDisabled(
    uint256 cohortId,
    uint256 index
  ) external returns (bool)
```

Check if the address in a cohort at the index is excluded from the vesting.

#### Parameters:

| Name       | Type    | Description                            |
| :--------- | :------ | :------------------------------------- |
| `cohortId` | uint256 | The id of the cohort.                  |
| `index`    | uint256 | A value from the generated input list. |

#### Return Values:

| Name       | Type    | Description                                                        |
| :--------- | :------ | :----------------------------------------------------------------- |
| `disabled` | uint256 | Whether the address at `index` has been excluded from the vesting. |

### setDisabled

```solidity
  function setDisabled(
    uint256 cohortId,
    uint256 index
  ) external
```

Exclude the address in a cohort at the index from the vesting.

#### Parameters:

| Name       | Type    | Description                            |
| :--------- | :------ | :------------------------------------- |
| `cohortId` | uint256 | The id of the cohort.                  |
| `index`    | uint256 | A value from the generated input list. |

### addCohort

```solidity
  function addCohort(
    bytes32 merkleRoot,
    uint64 distributionStart,
    uint64 distributionDuration,
    uint64 vestingPeriod,
    uint64 cliffPeriod
  ) external
```

Adds a new cohort. Callable only by the owner.

#### Parameters:

| Name                   | Type    | Description                                                                           |
| :--------------------- | :------ | :------------------------------------------------------------------------------------ |
| `merkleRoot`           | bytes32 | The Merkle root of the cohort. It will also serve as the cohort's ID.                 |
| `distributionStart`    | uint64  | The unix timestamp that marks the start of the token distribution. Current time if 0. |
| `distributionDuration` | uint64  | The length of the token distribtion period in seconds.                                |
| `vestingPeriod`        | uint64  | The length of the vesting period of the tokens in seconds.                            |
| `cliffPeriod`          | uint64  | The length of the cliff period in seconds.                                            |

### claim

```solidity
  function claim(
    uint256 cohortId,
    uint256 index,
    address account,
    uint256 amount,
    bytes32[] merkleProof
  ) external
```

Claim the given amount of the token to the given address. Reverts if the inputs are invalid.

#### Parameters:

| Name          | Type      | Description                                                 |
| :------------ | :-------- | :---------------------------------------------------------- |
| `cohortId`    | uint256   | The id of the cohort.                                       |
| `index`       | uint256   | A value from the generated input list.                      |
| `account`     | address   | A value from the generated input list.                      |
| `amount`      | uint256   | A value from the generated input list (so the full amount). |
| `merkleProof` | bytes32[] | An array of values from the generated input list.           |

### prolongDistributionPeriod

```solidity
  function prolongDistributionPeriod(
    uint256 cohortId,
    uint64 additionalSeconds
  ) external
```

Prolongs the distribution period of the tokens. Callable only by the owner.

#### Parameters:

| Name                | Type    | Description                                        |
| :------------------ | :------ | :------------------------------------------------- |
| `cohortId`          | uint256 | The id of the cohort.                              |
| `additionalSeconds` | uint64  | The seconds to add to the current distributionEnd. |

### withdraw

```solidity
  function withdraw(
    address recipient
  ) external
```

Sends the tokens remaining after the distribution has ended to `recipient`. Callable only by the owner.

#### Parameters:

| Name        | Type    | Description                       |
| :---------- | :------ | :-------------------------------- |
| `recipient` | address | The address receiving the tokens. |

## Events

### CohortAdded

```solidity
  event CohortAdded(
    uint256 cohortId
  )
```

This event is triggered whenever a call to {addCohort} succeeds.

#### Parameters:

| Name       | Type    | Description          |
| :--------- | :------ | :------------------- |
| `cohortId` | uint256 | Theid of the cohort. |

### Claimed

```solidity
  event Claimed(
    uint256 cohortId,
    address account,
    uint256 amount
  )
```

This event is triggered whenever a call to {claim} succeeds.

#### Parameters:

| Name       | Type    | Description                                |
| :--------- | :------ | :----------------------------------------- |
| `cohortId` | uint256 | The id of the cohort.                      |
| `account`  | address | The address that claimed the tokens.       |
| `amount`   | uint256 | The amount of tokens the address received. |

### DistributionProlonged

```solidity
  event DistributionProlonged(
    uint256 cohortId,
    uint256 newDistributionEnd
  )
```

This event is triggered whenever a call to {prolongDistributionPeriod} succeeds.

#### Parameters:

| Name                 | Type    | Description                          |
| :------------------- | :------ | :----------------------------------- |
| `cohortId`           | uint256 | The id of the cohort.                |
| `newDistributionEnd` | uint256 | The time when the distribution ends. |

### Withdrawn

```solidity
  event Withdrawn(
    address account,
    uint256 amount
  )
```

This event is triggered whenever a call to {withdraw} succeeds.

#### Parameters:

| Name      | Type    | Description                                |
| :-------- | :------ | :----------------------------------------- |
| `account` | address | The address that received the tokens.      |
| `amount`  | uint256 | The amount of tokens the address received. |

## Structs

### Cohort

```solidity
  struct Cohort{
    struct IMerkleVesting.CohortData data;
    mapping(address => uint256) claims;
    mapping(uint256 => uint256) disabledState;
  }
```

### CohortData

```solidity
struct CohortData {
  bytes32 merkleRoot;
  uint64 distributionStart;
  uint64 distributionEnd;
  uint64 vestingPeriod;
  uint64 cliffPeriod;
}

```
