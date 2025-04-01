// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoSavingsVault {
    // Mapping to store user balances
    mapping(address => uint256) public balances;

    // Deposit ETH into the vault
    function deposit() public payable {
        // Increase the sender's balance by the amount of ETH sent
        balances[msg.sender] += msg.value;
    }

    // Withdraw ETH from the vault
    function withdraw(uint256 amount) public {
        // Check if the user has sufficient balance
        require(balances[msg.sender] >= amount, "Insufficient balance");

        // Decrease the sender's balance
        balances[msg.sender] -= amount;

        // Transfer the specified amount of ETH to the sender
        payable(msg.sender).transfer(amount);
    }

    // View the balance of the sender
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
