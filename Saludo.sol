// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract Saludo {

    string saludo = "Saludos desde Avalanche";


    function leerSaludo() public view returns (string memory) {
        return saludo;
    }


    function guardarSaludo(string memory nuevoSaludo) public {
        saludo = nuevoSaludo;
    }
}
