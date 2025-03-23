
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GuessNumberGame {
    uint256 private secretNumber;
    uint256 public constant PRIZE_AMOUNT = 0.01 ether;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Generate a random number between 1 and 10
        secretNumber = (uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao))) % 10) + 1;
    }

    // Rest of the contract remains the same...


    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    // Function to allow the owner to fund the contract
    function fundContract() external payable onlyOwner {
        require(msg.value > 0, "You must send some ETH to fund the contract.");
    }

    // Function to allow users to guess the number
    function checkGuess(uint256 _guess) external returns (string memory) {
        require(_guess >= 1 && _guess <= 10, "Guess must be between 1 and 10.");
        require(address(this).balance >= PRIZE_AMOUNT, "Contract does not have enough funds to pay the prize.");

        if (_guess == secretNumber) {
            // Transfer the prize to the winner
            payable(msg.sender).transfer(PRIZE_AMOUNT);
            return "Congratulations! You guessed the correct number!";
        } else {
            return "Sorry, wrong guess. Try again!";
        }
    }

    // Function to allow the owner to withdraw funds
    function withdrawFunds() external onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    // Helper function to check the current prize amount
    function getPrizeAmount() external pure returns (uint256) {
        return PRIZE_AMOUNT;
    }

    // Helper function to check the contract balance
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}