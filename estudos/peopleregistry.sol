// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PeopleRegistry {
    
    struct Person {
        string name;
        uint age;
    }

    Person[] private people;
    mapping(string => uint) private nameToIndex;

    // Adiciona uma nova pessoa no array
    function registerPerson(string memory _name, uint _age) public {
        people.push(Person(_name, _age));
        nameToIndex[_name] = people.length - 1;
    }

    // Retorna a idade de uma pessoa pelo nome
    function getAgeByName(string memory _name) public view returns (uint) {
        uint index = nameToIndex[_name];
        require(index < people.length, "Pessoa nao encontrada");
        return people[index].age;
    }

    // Função que retorna quantas pessoas têm mais de X anos (exemplo de uso do for)
    function countPeopleAboveAge(uint _minAge) public view returns (uint count) {
        for (uint i = 0; i < people.length; i++) {
            if (people[i].age > _minAge) {
                count++;
            }
        }
    }

    // Lista todas as pessoas registradas
    function getAllPeople() public view returns (Person[] memory) {
        return people;
    }
}
