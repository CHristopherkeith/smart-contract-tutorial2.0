# 智能合约入门教程2.0

## ethfans上的教程 + 自己的代码实现

## 教程地址： 
https://ethfans.org/posts/ethereum-development-walkthrough-part-1-smart-contracts
https://ethfans.org/posts/ethereum-development-walkthrough-part-2-truffle-ganache-geth-and-mist

## 教程说明
###1.Truffle + Ganache
Truffle: 合约框架
Ganache: 测试网络框架
###2.Truffle + Geth + EthereumWallet(或Mist)
Geth: 连接以太坊网络
EthereumWallet: 以太坊钱包
EthereumWallet(或Mist)依赖于geth
###2.1部署命令
geth --datadir=./chaindata/ init ./genesis.json
geth --datadir=./chaindata/ --rpc
EthereumWallet –-rpc http://127.0.0.1:8545


## 合约方法说明 

## 玩家地址
WrestlingInstance.wrestler1.call()
WrestlingInstance.wrestler2.call()
## 游戏是否结束
WrestlingInstance.gameFinished.call()
## 赢家
WrestlingInstance.theWinner.call()
## 提取以太币
WrestlingInstance.withdraw({from: account1})
account1必须为赢家地址，若不是提币会回滚