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
