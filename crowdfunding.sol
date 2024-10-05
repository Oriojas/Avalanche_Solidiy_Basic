// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract crowdFunding {

    mapping(address => uint) public fundContributors; 
    address public manager; // administrador del contrato
    uint public deadline; // tiempo de vigencia de la campana
    uint public targetAmount; // objetivo de la campana
    uint public reaisedAmount; // cantidad recaudada

    struct Request {
        string description;
        address payable recipient;
        uint value;
        bool completed;
    }

    mapping (uint => Request) public requests;
    uint public numRequets;

    constructor(uint _targetAmount, uint _deadline) {
        targetAmount = _targetAmount;
        deadline = _deadline;
        deadline = block.timestamp + _deadline;
        manager = msg.sender;
    }

    // esta funcion nos permite enviar los fondos
    function sendFunds() public payable {
        require(block.timestamp < deadline, "Termino el deadline");
        fundContributors[msg.sender] += msg.value;
        reaisedAmount += msg.value;
    }

    // esta funcion nos retorna el valor recaudado
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // funcion de reembolso
    function refund() public  {
        require(block.timestamp > deadline && reaisedAmount < targetAmount, "No se cumplio el objetivo, te regresamos el dinero");
        uint amountToRefund = fundContributors[msg.sender];
        require(amountToRefund > 0, "No pusiste para la vaca");
        fundContributors[msg.sender] = 0;
    }

    //para que solo el administrador del contrato retire los fondos
    modifier onlyManager () {
        require(msg.sender == manager, "Solo el administrador del contrato puede retorar los fondos");
        _;
    }

    // funcion para enviar los fondos
    function createRequest(string memory _description, address payable _recipient, uint _value) public {
        Request storage newRequest = requests[numRequets];
        numRequets ++;
        newRequest.description = _description;
        newRequest.recipient = _recipient;
        newRequest.value = _value;
        newRequest.completed = false;

    }

    // funcion para hacer los pagos
    function makePayament(uint _requestNum) public onlyManager{
        require(reaisedAmount >= targetAmount, "No se cumplio la meta");
        Request storage thisRequest = requests[_requestNum];
        require(thisRequest.completed == false, "Esta peticion no fue completada");
        thisRequest.recipient.transfer(thisRequest.value);

        thisRequest.completed = true;
    }


}