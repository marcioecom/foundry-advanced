// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Script, console} from "forge-std/Script.sol";
import {Kronos} from "src/Kronos.sol";

contract DeployKronosToken is Script {
    function run() external returns (Kronos) {
        vm.startBroadcast(msg.sender);
        console.log("sender deploy: ", msg.sender);
        Kronos kronos = new Kronos(msg.sender);
        vm.stopBroadcast();
        return kronos;
    }
}
