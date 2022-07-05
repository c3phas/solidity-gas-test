# solidity-gas-test
Testing gas optimizations for split/not split require statement. This is a result of  a discussion on twitter that can be found https://twitter.com/JustDravee/status/1543735607544922113

This was tested with the compiler version ^0.8.13
The optimizer is enabled and set to 10K


### Setting things up

1. Install foundry, refer to [foundry](https://github.com/foundry-rs/foundry)
1. Install nodejs, refer to [nodejs](https://nodejs.org/en/)
1. Install yarn, npm install --global yarn


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


### Sample results(renamed the function names for ease of reading here :) pretty chaotic dev )
- When the revert condition is not met it is cheaper to have split require statements 
```solidity
function split(uint256 num) public pure returns (uint256){
    require (num > 20, "num should be > 20");
    require (num < 30, "num should be < 30");
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


## Working with two variables

```solidity
    function split(uint256 num1, uint256 num2) public pure returns(uint256){
        require (num1 < 10,"num1 should be < 10");
        require(num2 > 15, "num2 should be > 15");
        return num2 - num1;
    }
```
Gas -- 5512

```solidity
    function notsplit(uint256 num1,uint256 num2) public pure returns(uint256){
        require (num1 < 10 && num2 > 15, "num1 should be < 10 & num2 > 15");
        return num2 - num1;
    }
```
Gas -- 5531

When one of the require statement(or both) fails it is cheaper to have split require statement compared to using && (~19 gas cheaper) ie if revert condition is met

When both revert condition are not met, it is also cheaper to have split statements( ~8 gas cheaper)


**NOTE**: As the order of functions affects how much gas is consumed it is advisable to test one function at a time or simply try them from two different contracts.





