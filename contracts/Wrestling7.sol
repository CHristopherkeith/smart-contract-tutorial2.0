pragma solidity ^0.4.17;

contract Wrestling7 {
    
    address public wrestler1;
	address public wrestler2;

	bool public wrestler1Played;
	bool public wrestler2Played;

	uint private wrestler1Deposit;
	uint private wrestler2Deposit;

	bool public gameFinished; 
	address public theWinner;
	uint gains;

	event WrestlingStartsEvent(address wrestler1, address wrestler2);
	event EndOfRoundEvent(uint wrestler1Deposit, uint wrestler2Deposit);
	event EndOfWrestlingEvent(address winner, uint gains);

	function Wrestling7() public {
	  wrestler1 = msg.sender;
	}

	function registerAsAnOpponent() public {
	    require(wrestler2 == address(0));

	    wrestler2 = msg.sender;

	    WrestlingStartsEvent(wrestler1, wrestler2);
	}

	function wrestle() public payable {
        require(!gameFinished && (msg.sender == wrestler1 || msg.sender == wrestler2));

        if(msg.sender == wrestler1) {
            require(wrestler1Played == false);
            wrestler1Played = true;
            wrestler1Deposit = wrestler1Deposit + msg.value;
        } else { 
            require(wrestler2Played == false);
            wrestler2Played = true;
            wrestler2Deposit = wrestler2Deposit + msg.value;
        }
        if(wrestler1Played && wrestler2Played) {
            if(wrestler1Deposit >= wrestler2Deposit * 2) {
                endOfGame(wrestler1);
            } else if (wrestler2Deposit >= wrestler1Deposit * 2) {
                endOfGame(wrestler2);
            } else {
                endOfRound();
            }
        }
    }

    function endOfRound() internal {
        wrestler1Played = false;
        wrestler2Played = false;

        EndOfRoundEvent(wrestler1Deposit, wrestler2Deposit);
    }

    function endOfGame(address winner) internal {
        gameFinished = true;
        theWinner = winner;

        gains = wrestler1Deposit + wrestler2Deposit;
        EndOfWrestlingEvent(winner, gains);
    }

    function withdraw() public {
        require(gameFinished && theWinner == msg.sender);

        msg.sender.transfer(this.balance);
    }

    // 原教程没有，添加此函数对合约的业务逻辑进一步完善，我认为，角力结束后应当清除相应的状态，以控制合约的生命周期
    // 添加清除状态函数
    function clearState() public {
        gameFinished = false;
        wrestler1Played = false;
        wrestler2Played = false;
    }

}