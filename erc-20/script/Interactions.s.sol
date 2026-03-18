// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Script, console} from "forge-std/Script.sol";
import {Kronos} from "src/Kronos.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";

contract MintTokens is Script {
    address[] private destinations =
        [0x03B2E47F788D645e6D86b34B5119d3f5711f033A, 0x8E12BC1fEd98af03CfB2cE5e6ca491b04c887b17];

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("Kronos", block.chainid);

        console.log("Token Owner: ", msg.sender);
        console.log("Minting Token: ", mostRecentlyDeployed);
        console.log("On ChainId: ", block.chainid);

        Kronos kronosContract = Kronos(mostRecentlyDeployed);
        uint256 mintAmount = 10 * 10 ** kronosContract.decimals();

        vm.startBroadcast(msg.sender);
        for (uint256 index = 0; index < destinations.length; index++) {
            address destination = destinations[index];
            kronosContract.mint(destination, mintAmount);
        }
        vm.stopBroadcast();
    }
}
