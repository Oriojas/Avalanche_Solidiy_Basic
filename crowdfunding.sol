// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract CrowdFunding {
    mapping(address => uint) public fundContributors; // dinero que se va a donar
    address public manager; // administrador del contrato
    uint public deadline; // tiempo de campana
    uint public targetAmount; // objetivo de la camapana
    uint public raisedAmount; // dinero realmente recogido

    struct Request {
        string description;
        address payable recipient;
        uint value;
        bool completed;
    }

    mapping(uint => Request) public requests;
    uint public numRequests;

    constructor(uint _targetAmount, uint _deadline) {
        targetAmount = _targetAmount;
        deadline = block.timestamp + _deadline;
        manager = msg.sender;
    }

    // esta funcion me permite hacer la donacion a mi contrato
    function sendFunds() public payable {
        require(block.timestamp < deadline, "El plazo ha terminado");
        fundContributors[msg.sender] += msg.value;
        raisedAmount += msg.value;
    }

    // consultar el balance de el contrato
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // transferir los fondos del contrato una vez se cumplan las condiciones de tiempo y valor
    function refund() public  {
        require(block.timestamp > deadline && raisedAmount < targetAmount, "La meta fue alcanzada o el plazo no ha terminado");
        uint amountToRefund = fundContributors[msg.sender];
        require(amountToRefund > 0, "No has contribuido fondos");
        fundContributors[msg.sender] = 0;
        payable(msg.sender).transfer(amountToRefund);
    }

    // me permite que solo la persona que desplego el contrato pueda ejecutar esas funciones
    modifier onlyManager() {
        require(msg.sender == manager, "Solo el administrador puede realizar esta accion");
        _;
    }

    // si se cumplio el objetivo y el que lo ejecuta es el manager puedo sacar dinero del contrato a un tercero
    function createRequest(string memory _description, address payable _recipient, uint _value) public onlyManager {
        require(raisedAmount >= _value, "No hay fondos suficientes para esta solicitud");
        Request storage newRequest = requests[numRequests];
        numRequests++;
        newRequest.description = _description;
        newRequest.recipient = _recipient;
        newRequest.value = _value;
        newRequest.completed = false;
    }

    // esta funcion me permite hacer el pago de la peticion anterior
    function makePayment(uint _requestNum) public onlyManager {
        require(raisedAmount >= targetAmount, "No se cumplio la meta");
        Request storage thisRequest = requests[_requestNum];
        require(!thisRequest.completed, "Esta peticion ya fue completada");
        thisRequest.recipient.transfer(thisRequest.value);
        thisRequest.completed = true;
    }

}