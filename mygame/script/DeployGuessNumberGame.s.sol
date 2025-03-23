// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol"; // Correct import

contract DeployCounter is Script {
    function run() external {
        // Start broadcasting transactions
        vm.startBroadcast();

        // Deploy the Counter contract
        Counter counter = new Counter(); // Correct contract name

        // Log the deployed contract address
        console.log("Counter deployed at:", address(counter));

        // Stop broadcasting transactions
        vm.stopBroadcast();
    }
}