# LibBootstrap

## Functions

### delegatecallBootstrapFunction

```solidity
  function delegatecallBootstrapFunction(
    address target,
    bytes data
  ) internal
```

Perform a delegatecall and ensure it returns the magic bytes.

#### Parameters:

| Name     | Type    | Description      |
| :------- | :------ | :--------------- |
| `target` | address | The call target. |
| `data`   | bytes   | The call data.   |

## State variables

```solidity
  bytes4 BOOTSTRAP_SUCCESS;
```
