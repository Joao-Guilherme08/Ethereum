// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 private storedNumber;

    // Função para armazenar um número
    function set(uint256 _num) public {
        storedNumber = _num;
    }

    // Função para recuperar o número armazenado
    function get() public view returns (uint256) {
        return storedNumber;
    }
}
