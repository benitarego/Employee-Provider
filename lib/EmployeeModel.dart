import 'package:flutter/cupertino.dart';

class Employee {
  final String id;
  final String name;
  var salary;

  Employee({this.id, this.name, this.salary});
}

class EmployeeModel extends ChangeNotifier {
  List<Employee> employeeList = [
    Employee(id: "1", name: "Employee One", salary: 11520.0),
    Employee(id: "2", name: "Employee Two", salary: 20000.0),
    Employee(id: "3", name: "Employee Three", salary: 28800.0),
    Employee(id: "4", name: "Employee Four", salary: 38400.0),
    Employee(id: "5", name: "Employee Five", salary: 50000.0),
  ]; //contians all the task

  void thumbsUp(String id) {
    final targetEmployeeIndex = employeeList.indexWhere((emp) => emp.id == id);
    if (targetEmployeeIndex != null) {
      employeeList[targetEmployeeIndex].salary +=
          employeeList[targetEmployeeIndex].salary * 0.2;
    }
    notifyListeners();
  }

  void thumbsDown(String id) {
    final targetEmployeeIndex = employeeList.indexWhere((emp) => emp.id == id);
    if (targetEmployeeIndex != null) {
      employeeList[targetEmployeeIndex].salary -=
          employeeList[targetEmployeeIndex].salary * 0.1;
    }
    notifyListeners();
  }
}
