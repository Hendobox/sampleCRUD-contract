pragma solidity >=0.4.22 <0.6.0;

import "./ExternalStorage.sol";

contract EntranceTest is ExternalStorage{
    
     address owner = msg.sender;
     address latestOwner;
    
    modifier onlyOwner() {
       require(msg.sender == latestOwner);
        _;
    }
    
    constructor () public {
        owner = msg.sender;
    }

    function changeOwner(address _newOwner) public {
        require(msg.sender == owner);
        latestOwner = _newOwner;
    }
    
    function isStudent(address _regNumber) public view returns(bool) {
        return students[_regNumber].isStudent;
    }

    function admitStudent(address _regNumber, string memory _name, uint _age) public onlyOwner returns(bool) {
        Student memory _studentStruct;
        _studentStruct.name = _name;
        _studentStruct.age = _age;
        _studentStruct.isStudent = true;
        students[_regNumber] = _studentStruct;
        
        emit NewStudent(_name);
        return true;
    }
    
    function expelStudent(address _regNumber, string calldata _name) onlyOwner external {
        delete students[_regNumber];
        
        emit Expelled(_regNumber, _name);
    }
}