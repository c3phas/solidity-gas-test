# solidity-gas-test
Testing gas optimizations for split/not split require statement.

This was tested with the compiler version ^0.8.13
The optimizer is enabled and set to 10K


### Setting things up

    1.Install foundry, refer to [foundry](https://github.com/foundry-rs/foundry)
    2.Install nodejs, refer to [nodejs](https://nodejs.org/en/)
    3.Install yarn, npm install --global yarn


```
git clone https://github.com/c3phas/solidity-gas-test.git
cd solidity-gas-test
yarn
forge install
forge test --gas-report

```
### tests
By default the test is set to fail, you can modify this behavior by adjusting the arguments passed to the test files.


### Foundry.toml
You can adjust the optimizer here


### Sample results
- When the revert condition is not met it is cheaper to have split require statements 
```
function split(uint256 num1,uint256 num2) public pure returns (uint256){
    require (num1 > 10, "num1 should be > 10");
    require (num2 < 10, "num2 should be < 10);
    return num1-num2;
}
```


- When the revert condition is met, it is cheapert to use && to combine the require statements
```
function split(uint256 num1,uint256 num2) public pure returns (uint256){
    require (num1 > 10 && num2 < 10, "num1 should be > 10 && num2 < 10");
    return num1-num2;
}
```


