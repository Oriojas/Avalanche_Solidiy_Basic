// SPDX-License-Identifier: MIT
// Contrato de saludo dinamico en Solidity

// 0x2c97266F9D53146329A04b3EbEA85F11E55e3fF6

pragma solidity 0.8.24;

contract Hola_Mundo_Dinamico {

    string Saludo_d = "Hola Dinamico";
    string public Saludo_e = "Hola Estatico";

    function leerSaludo() public view returns (string memory) {
        return Saludo_d;
    }

    function guardarSaludo(string memory nuevoSaludo) public {
        Saludo_d = nuevoSaludo;
    }

}