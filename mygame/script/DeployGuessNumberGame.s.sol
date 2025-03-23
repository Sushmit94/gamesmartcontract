// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {GuessNumberGame} from "../src/GuessNumberGame.sol"; //Ensure this path is correct

contract DeployGuessNumber is Script {
    function run() external {
        // Start broadcasting transactions
        vm.startBroadcast();

        // Deploy the GuessNumber contract
        GuessNumberGame guessNumber = new GuessNumberGame();

        // Log the deployed contract address
        console.log("GuessNumber deployed at:", address(guessNumber));

        // Stop broadcasting transactions
        vm.stopBroadcast();
    }
}