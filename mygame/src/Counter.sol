// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint256 private _number;

    // Getter function for the number
    function number() public view returns (uint256) {
        return _number;
    }

    // Setter function for the number
    function setNumber(uint256 newNumber) public {
        _number = newNumber;
    }

    // Increment function
    function increment() public {
        _number += 1;
    }

    // Decrement function
    function decrement() public {
        _number -= 1;
    }
}