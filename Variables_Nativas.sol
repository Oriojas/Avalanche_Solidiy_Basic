// SPDX-License-Identifier: MIT
// Variables nativas de solidity

pragma solidity 0.8.24;

contract Variables_Nativas {

    string private fullName; // Solo la puedo cambiar en el momento que inicializo el contrato

    constructor(string memory _lastName) {
        fullName = string.concat("Mi nombre es:", " ", _lastName); // variables de incializacion
    }

    function getName() public view returns (string memory) {
        return fullName;
    }

    /*
    uint enteros sin signo (no negativos)
    
    uint8 rango de 0 a 2 ** 8 - 1 
    uint16 rango de 0 a 2 ** 16 - 1

    . . . 
    uint256 rango de 0 a 2 ** 256 - 1    
    */

    uint8 public uint_8 = 1;
    uint256 public uint_256 = 234;

    // int enteros pero a diferencia del uint me permite numeros negativos
    int8 public int_8 = -1;
    int256 public int_256 = 456;

    // la variable de tipo address propia de Solidity y me permite almacenar direcciones
    address public  address_var = 0x1d870f1210e66cba98093682b84d4491Ec04141b;

    // bytes guardar datos de typo binario
    bytes1 a_var = 0xb5; // [10110101]
    bytes1 b_var = 0x56; // [01011010]
    bytes1 c_var;

    function getBytes() public view returns (bytes1){
        return c_var;
    }

}