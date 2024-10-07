// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

//0x00F8CcbBD073AF1CCB60cd244EdEE86de5085a52

contract Mapping {
    // Definimos un mapping de direcciones y enteros
    mapping(address => uint256) balances; 

    // funcion para establecer el balance de Avax en el mapping
    function setBalance(address _addr) public  {
        uint256 avaxBalance = _addr.balance;
        balances[_addr] = avaxBalance;
    }

    // Funcion para obtener el valor del mapping en la direccion indice
    function getBalance(address _addr) public view returns (uint256) {
        return balances[_addr];
    }

    // Funcion me permite eliminar un valor del mapping
    function remove(address _addr) public {
        delete balances[_addr];
    }

    // Funcion que llma otra funcion ya creada para actualizar los balances del mapping
    function updateBalanceAvax(address _addr) public {
        setBalance(_addr);
    }

}