// 加载所需框架
var web3 = require('web3');
var contract = require("truffle-contract");
var config = require('../build/contracts/Wrestling7.json')

// 合约实例
var wrestling = contract(config)

// 为合约指定测试网络
var provider = new web3.providers.HttpProvider("http://localhost:7545");
wrestling.setProvider(provider);

// web3实例
var web3Ins = new web3(provider);

// console.log(web3Ins, 'web3Ins')

// 部署合约并返回一个部署后的实例
var WrestlingInstance;
var rs = wrestling.deployed()
	.then(
		inst => {
			WrestlingInstance = inst;
			console.log('success');
			// 获取账号
			account0 = web3Ins.eth.accounts[0]; 
			account1 = web3Ins.eth.accounts[1];
			// console.log(account0,account1) ;
			// 二号玩家注册
			WrestlingInstance.wrestler2.call().then(inst => {
				console.log(inst)
			})
			// console.log(typeof WrestlingInstance.wrestler2.call())
			WrestlingInstance.registerAsAnOpponent({from: account1});
			// 开始角力
			WrestlingInstance.wrestle({from: account0, value: web3Ins.toWei(2, "ether")})  
			WrestlingInstance.wrestle({from: account1, value: web3Ins.toWei(3, "ether")})  
			WrestlingInstance.wrestle({from: account0, value: web3Ins.toWei(5, "ether")})  
			WrestlingInstance.wrestle({from: account1, value: web3Ins.toWei(20, "ether")}) 
			// 查询余额
			console.log(web3Ins.eth.getBalance(account0));
			console.log(web3Ins.eth.getBalance(account1));
			// 提取以太币
			WrestlingInstance.withdraw({from: account1})
			.then(
				function(){
					// 查询余额
					console.log(web3Ins.eth.getBalance(account0));
					console.log(web3Ins.eth.getBalance(account1));
					// 重置合约状态
					WrestlingInstance.clearState({from: account1})
					// 重置二号玩家
					WrestlingInstance.resetAnOpponent({from: account1})
				}
				
			);
			
		}
	)
	.catch(
		inst => {
			console.log('error');console.log(inst)
		}
	);