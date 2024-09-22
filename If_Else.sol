// SPDX-License-Identifier: MIT

/*
Este contrato actua como un portero que solo deja entrar si se es mayor de edad
*/

pragma solidity 0.8.24;

contract If_Else {

    uint256 public numero; // variable de estado que va alamcenar la edad
    uint256 public edad_init; // la edad limite para la mayoria de edad

    constructor(uint256 _edad_int) {
        edad_init = _edad_int;
    }

    function establecerNumero(uint256 _numero) public { // funcion establece el valor de numero
        numero = _numero;
    }

    function mensaje() public view returns(string memory) {

        // control de flujo if - else
        if(numero > edad_init) {
            return "Puedes ingresar eres mayor de edad";   
        // condicion secundaria             
        } else if (numero == edad_init) {
            return "Acabas de cumplir mayoria de edad puedes ingresar";
        } else {
        // condicion final
            return "Eres menor de edad no puedes ingresar";
        }
    }
    
}