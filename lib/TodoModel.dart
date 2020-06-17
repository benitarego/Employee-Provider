import 'package:flutter/cupertino.dart';

class Employee {
  final String id;
  final String name;
  var salary;

  Employee({this.id, this.name, this.salary});
}

class TodoModel extends ChangeNotifier {
  List<Employee> employeeList = [
    Employee(id: "1", name: "Benita Rego", salary: 1234.0),
    Employee(id: "2", name: "Nolita Rego", salary: 1234.0),
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
