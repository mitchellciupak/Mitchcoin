# ICO for Mitchcoin

//Version of compilrt
pragma solidity ^0.4.11;

contract Mitchcoin_ICO {
    //max num of mitchcoins available for sale 
    uint public maxMitchcoin = 1000000;
    
    //USD to Mitchcoin conversion rate
    uint public usd_to_mitchcoin = 1000;
    
    //total num of mitchcoins purchased by the public
    uint public total_mitchcoins_purchased = 0;

    //mapping from the investor address to its equity in Mitchcoin and usd_to_mitchcoin
    mapping(address => uint) equity_mitchcoin;
    mapping(address => uint) equity_usd;
    
    //check for valid investor
    modifier can_buy_mitchcoins(uint usd_invested) {
        require (usd_invested * usd_to_mitchcoin + total_mitchcoins_purchased <= maxMitchcoin);
        _;
    }
    
    //Get equity in Mitchcoin of an investor
    function equity_in_mitchcoin(address investor) external constant returns (unit) {
        return equity_mitchcoin[investor];
    }
    
    //Get equity in USD of an investor
    function equity_in_usd(address investor) external constant returns (unit) {
        return equity_usd[investor];
    }
    
    //Buy Mitchcoin
    function buyMitchcoin(address investor, uint usd_invested) external
    can_buy_mitchcoins(usd_invested) {
        uint Mitchcoin_purchased = usd_invested * usd_to_mitchcoin;
        equity_mitchcoin[investor] += Mitchcoin_purchased;
        equity_usd[investor] += equity_mitchcoin[investor] / 1000;
        total_mitchcoins_purchased += Mitchcoin_purchased;
        
    }
    
    //Sell Mitchcoin
    function sellMitchcoin(address investor, uint uint mitchcoinSold) external {
        equity_mitchcoin[investor] -= mitchcoinSold;
        equity_usd[investor] += equity_mitchcoin[investor] / 1000;
        total_mitchcoins_purchased -= mitchcoinSold;
    }
    
}                                                      

