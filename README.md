# 智能合约入门教程2.0

## ethfans上的教程 + 自己的代码实现

## 教程地址： 
https://ethfans.org/posts/ethereum-development-walkthrough-part-1-smart-contracts
https://ethfans.org/posts/ethereum-development-walkthrough-part-2-truffle-ganache-geth-and-mist

## 教程说明
1.Truffle + Ganache
2.Truffle + Geth + Mist

## 方法说明 

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