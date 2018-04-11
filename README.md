# 智能合约入门教程2.0


## 二、教程说明

### 依照ethfans上的教程，尝试了两种合约开发方法，分别是
1.1 Truffle + Ganache  
1.2 Truffle + Geth + EthereumWallet(或Mist)  

## 三、教程地址： 

https://ethfans.org/posts/ethereum-development-walkthrough-part-1-smart-contracts  
https://ethfans.org/posts/ethereum-development-walkthrough-part-2-truffle-ganache-geth-and-mist  
https://ethfans.org/posts/ethereum-development-walkthrough-part-3


## 四、开发环境

### 对应两种开发方法，有两种开发环境：
1.1 windows7 + node v6.10.3 + truffle v4.1.3 + ganache-cli v6.1.0  
1.2 windows7 + node v6.10.3 + geth 1.8.2 + Ethereum Wallet 

## 五、关键步骤及说明

### 1.使用Truffle + Ganache开发（对应合约Wrestling..sol与Wrestling3.sol）
Truffle: 合约框架    
Ganache: 测试网络  

### 1.1启动测试网络
ganache-cli -p 7545  

### 1.2编译合约
truffle compile  

### 1.3迁移（部署）合约
truffle migrate --network development  

### 1.4启动truffle控制台（用于合约与区块链网络的交互）
truffle console --network development  

### 1.5获取账户
web3.eth.account  

### 1.6其他合约与区块链网络的交互操作
......

### 2.使用Truffle + Geth + EthereumWallet(或Mist)开发（对应合约Wrestling..sol与Wrestling3.sol）
Truffle: 合约框架   
Geth: 搭建本地区块链测试网络  
EthereumWallet: 以太坊钱包,用于观察，部署合约  
EthereumWallet(或Mist)依赖于geth  

### 2.1部署命令（在项目根目录下）
在项目根目录下开启命令窗口，输入：  
初始化区块数据  
geth --datadir=./chaindata/ init ./genesis.json  
启动区块链网络  
geth --datadir=./chaindata/ --rpc --rpcapi db,eth,net,web3,personal,web3  
开启另一个窗口，将以太坊钱包链接到测试网络  
EthereumWallet --rpc http://127.0.0.1:8545  

### 2.2在以太坊钱包创建账户
输入密码，例如：123456789  

### 2.3连接到区块链节点的JavaScript环境的交互窗口（与区块链节点的交互）
开启另一个命令窗口，输入：  
Linux: geth attach ipc:Users/zzs/develop/eth/data-test/geth.ipc  
attach后面的为在Linux环境下geth数据存储目录下的geth.ipc文件  
windows: geth attach ipc:\\.\pipe\geth.ipc  
windows直接运行get attach报错，通过管道指定geth.ipc解决；或直接geth attach http://127.0.0.1:8545  

### 2.4挖矿（在2.3开启的窗口下）
开始挖矿：miner.start()  
停止挖矿：miner.stop()  

### 2.5解锁账户（在2.3开启的窗口下）
personal.unlockAccount('0x4FD9B9D689FF9c40520eeeD26d7081075980D4A5', '123456789')  
personal.unlockAccount('0x1bad00FC9EE40E7C317Ce8A45049e26E3471EC5D', '123456789')  

### 2.6部署合约（在根目录下）
truffle migrate --network ourTestNet  

### 2.7启动truffle控制台（在根目录下，用于合约与区块链网络的交互）
truffle console --network ourTestNet  

### 2.6查看合约地址和描述
Wrestling.address  
JSON.stringify(Wrestling.abi)  

### 2.7其他合约与区块链网络的交互操作
......

### 3.安全性、限制性以及一些顾虑(对应合约Wrestling4.sol)  

## 五、合约方法说明 

### 1.1返回合约实例
Wrestling.deployed().then(inst => { WrestlingInstance = inst })  

### 1.2开始角力
WrestlingInstance.wrestle({from: account0, value: web3.toWei(2, "ether")})  
WrestlingInstance.wrestle({from: account1, value: web3.toWei(3, "ether")})  
// End of the first round  
WrestlingInstance.wrestle({from: account0, value: web3.toWei(5, "ether")})  
WrestlingInstance.wrestle({from: account1, value: web3.toWei(20, "ether")})  
// End of the wrestling  

### 1.3玩家地址
WrestlingInstance.wrestler1.call()  
WrestlingInstance.wrestler2.call()  

### 1.4游戏是否结束
WrestlingInstance.gameFinished.call()  

### 1.5赢家
WrestlingInstance.theWinner.call()  

### 1.6提取以太币
WrestlingInstance.withdraw({from: account1})  
account1必须为赢家地址，若不是提币会回滚  