// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract tc_avax {

    // determinar la direccion de la billetera que crea el contrato
    address payable public owner;

    struct Data {
        string date;
        string delivery_date;
        string product;
        string price;
        string code;
        string cel_number;
        int8 status;
        address wallet;
    }

    Data public data;

    event newData(
        string date,
        string delivery_date,
        string product,
        string price,
        string code,
        string cel_number,
        int8 status,
        address wallet
    );

    // modifier para que solo el ownwr pueda retirar los fondos del contratoi
    modifier onlyOwner(){
        require(msg.sender == owner, "Solo el propietario puede retirar los fondos");
        _;
    }

    /* 
    modifier lo que hace es verificar dentro de otras funciones que al ejecutar 
    la funcio nse tenga el valor del fee + el gas
    */
    modifier cost(uint amount) {
        require(msg.value >= amount, "No tiene saldo en AVAX para ejcutar");
        _;
    }

    constructor(){
        owner = payable(msg.sender);
    }

    // funcion para cambiar los datos del enum
    function pushData(string memory _date,
                      string memory _delivery_date,
                      string memory _product,
                      string memory _price,
                      string memory _code,
                      string memory _cel_number,
                      int8 _status) public payable cost(100000000000000000){
        
        data = Data(_date,
                    _delivery_date,
                    _product,
                    _price,
                    _code,
                    _cel_number,
                    _status,
                msg.sender
                );

        emit newData(_date,
                    _delivery_date,
                    _product,
                    _price,
                    _code, 
                    _cel_number, 
                    _status, 
                    msg.sender);
        }

        // funcion para retirar los fondos del contrato
        function withdraw() public onlyOwner {
            uint balance = address(this).balance;
            require(balance > 0, "No se tienen fondos en el contrato todavia");
            owner.transfer(balance);
        }

        // funcion para consultar el valor que se encuentra en el contrato
        function getBalance() public view returns (uint256) {
            return address(this).balance;
        }   
    


}