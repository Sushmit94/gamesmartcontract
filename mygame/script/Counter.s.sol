// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/GuessNumberGame.sol";
import "../src/Counter.sol";
contract DeployGuessNumberGame is Script {
    function run() external {
        // Start broadcasting transactions
        vm.startBroadcast();

        // Deploy the GuessNumberGame contract
        GuessNumberGame game = new GuessNumberGame();

        // Fund the contract with 0.1 ETH (for prizes)
        payable(address(game)).transfer(0.1 ether);

        // Stop broadcasting transactions
        vm.stopBroadcast();

        // Log the deployed contract address
        console.log("GuessNumberGame deployed at:", address(game));
    }
}