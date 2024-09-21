// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract Solidiy_Vars {
    
    address public block_now;                       // direccion del minero actual
    uint public block_diff;                         // dificultad del bloque actual
    uint public block_num;                          // numero de blocuqe de la cadena actual
    bytes32 public block_hash;                      // tipo de dato para el block hash
    uint public time_stamp;                         // marca de tiempo actual en formato epoch
    uint public gas_left;                           // gas restante
    address public sender;                          // direccion de quien esta haciendo la llamada al contrato
    bytes4 public sig_id;                           // primeros 4 bytes de la llamada a la fucnion
    uint public gas_limit;                          // limite de gas del bloque actual

    function updateParams() public  {
        
        block_now = block.coinbase;
        block_diff = block.prevrandao;
        block_num = block.number;
        time_stamp = block.timestamp;
        gas_left = gasleft();
        sender = msg.sender;
        sig_id = msg.sig;
        gas_limit = block.gaslimit;

    }

} // 35878876 - 35878955


