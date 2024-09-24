// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract Array {
    // Dos formas de inicializar un array vector = [11, 22, 33, 44], vector[2] == print(33)
    uint256[] public arr;
    uint256[] public arr2 = [22, 33, 44];
    // Inicializar un array de tamano fijo, todos los elementos en el array van a ser iguales a 0
    uint256[10] public arr3;

    // me trar un elemento particular de una array
    function get(uint256 _i) public view returns (uint256) {
        return arr2[_i];
    }

    // trae todos los elementos de un array
    function getArr() public view returns (uint256[] memory) {
        return arr2;
    }

    // me introduce un nuevo elemento dentro del array
    function push(uint256 _i) public {
        arr2.push(_i);
    }

    // este codigo borra el ultimo elemento del array
    function pop() public {
        arr2.pop();
    }

    // este codigo regresa la longitud del array
    function getLength() public view returns (uint256) {
        return arr2.length;
    }

    // eliminar un elemento en particular
    function remove(uint256 _index) public {
        delete arr2[_index];
    }
}