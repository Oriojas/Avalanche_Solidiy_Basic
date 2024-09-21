// SPDX-License-Identifier: MIT

/*
Este contrato guerda los siguientes datos en la blockchain:
    - Nombre
    - Correo electronico
    - Numero de telefono en formato de numero
*/

pragma solidity 0.8.24;

// es una buena practica que el nombre del contrato sea el nombre del archivo
contract Libreta {

    string nombre = "Pablo Perez";
    string correo = "pp@mail.com";
    uint256 telefono = 1234567890;

    function guardarNombre(string memory _nombre) public {
        nombre = _nombre;
    }

    function leerNombre() public view returns (string memory){
        return nombre;
    }

    function guadarCorreo(string memory _correo) public {
        correo = _correo;
    }

    function leerCorreo() public view returns (string memory) {
        return correo;
    }

    function guardarTelefono(uint256 _telefono) public {
        telefono = _telefono;
    }

    function leerTelefono() public view returns (uint256) {
        return telefono;
    }
}