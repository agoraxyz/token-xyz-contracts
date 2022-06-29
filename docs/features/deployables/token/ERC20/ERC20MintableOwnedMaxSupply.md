# ERC20MintableOwnedMaxSupply

A mintable ERC20 token.



## Functions
### constructor
```solidity
  function constructor(
  ) public
```




### mint
```solidity
  function mint(
    address account,
    uint256 amount
  ) public
```
Mint an amount of tokens to an account.


#### Parameters:
| Name | Type | Description                                                          |
| :--- | :--- | :------------------------------------------------------------------- |
|`account` | address | The address of the account receiving the tokens.
|`amount` | uint256 | The amount of tokens the account receives.






## State variables
```solidity
  uint256 maxSupply;
```