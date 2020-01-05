pragma solidity >=0.4.22 <0.6.0;

contract ExternalStorage{
    
     struct Student{
        string name;
        uint age;
        bool isStudent;
        address regNumber;
    }
    
    mapping(address => Student) internal students;
    
    event NewStudent(string _name);
    event Expelled(address indexed _regNumber, string _name);
}