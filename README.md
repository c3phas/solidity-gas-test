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
```solidity
function split(uint256 num) public pure returns (uint256){
    require (num > 20, "num should be > 20");
    require (num < 30, "num should be < 30);
    return num;
}
```
![failed](https://user-images.githubusercontent.com/29732994/177159032-4c8b5f01-1613-485f-b795-f1151c94a3c1.png)


- When the revert condition is met, it is cheapert to use && to combine the require statements
```solidity
function split(uint256 num) public pure returns (uint256){
    require (num > 20 && num < 30, "num should be > 20 && < 30");
    return num;
}
```
![passed](https://user-images.githubusercontent.com/29732994/177159053-8bdf57c9-7ea5-4a97-9e1a-9193acd932a0.png)






