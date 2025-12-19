// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentManagement {

    // Student structure
    struct Student {
        uint id;
        string name;
        uint age;
        string department;
        bool isStored;
    }

    // Mapping to link student id with data
    mapping(uint => Student) private studentList;

    // Add a new student
    function addStudent(
        uint _id,
        string memory _name,
        uint _age,
        string memory _department
    ) public {
        require(studentList[_id].isStored == false, "Student already exists");

        studentList[_id].id = _id;
        studentList[_id].name = _name;
        studentList[_id].age = _age;
        studentList[_id].department = _department;
        studentList[_id].isStored = true;
    }

    // Update existing student information
    function updateStudent(
        uint _id,
        string memory _name,
        uint _age,
        string memory _department
    ) public {
        require(studentList[_id].isStored, "Student does not exist");

        studentList[_id].name = _name;
        studentList[_id].age = _age;
        studentList[_id].department = _department;
    }

    // Retrieve student details using id
    function getStudent(uint _id)
        public
        view
        returns (uint, string memory, uint, string memory)
    {
        require(studentList[_id].isStored, "Student does not exist");

        Student memory student = studentList[_id];
        return (
            student.id,
            student.name,
            student.age,
            student.department
        );
    }
}
