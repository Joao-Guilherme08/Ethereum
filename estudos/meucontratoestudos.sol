// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Coin {
    //VARIAVEIS DE ESTADO DO MEU CONTRATO
    address public minter;
    //É COMO UM DICIONARIO OU LISTA TELEFONICA, address => uint quer dizer > Quer dizer que para cada address (cada pessoa), teremos um uint (um número inteiro sem sinal, que só pode ser positivo) associado. Esse uint será o saldo de moedas dessa pessoa.
    mapping(address => uint) public balances;

   //Isso define um evento. Eventos são como "avisos" ou "registros" que seu contrato pode emitir. Eles não alteram o estado do contrato diretamente, mas são gravados no blockchain e podem ser "ouvidos" por programas externos (como carteiras digitais ou exploradores de blockchain). Neste caso, sempre que moedas forem enviadas, um evento Sent será emitido com quem enviou (from), para quem (to) e a quantidade (amount). Isso é super útil para monitorar o que está acontecendo com sua moeda.
    event Sent(address from, address to, uint amount);
    //CONSTRUTOR 
    constructor(){
        minter = msg.sender;
        
    }
    //funcao que permite cunhar novas moedas
    //Require - verificacao de seguranca
    function mint ( address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }
    //Mensagem de erro personalizada
    error InsufficientBalance(uint requested, uint avaible);

    //Esta é a função principal para transferir moedas.
    //Finalmente, um evento Sent é emitido, registrando a transação no blockchain.
    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], InsufficientBalance(amount, balances[msg.sender]));
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}

