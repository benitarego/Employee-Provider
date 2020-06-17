import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:employeeprovider/EmployeeModel.dart';

import 'EmployeeModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Employee App',
        home: ChangeNotifierProvider(
          builder: (context) => EmployeeModel(),
          child: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text(
          "Employee App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
            children: <Widget>[
          Expanded(
            child: Card(
                child: Consumer<EmployeeModel>(
                  builder: (context, employee, child) {
                    return ListView.builder(
                        itemCount: employee.employeeList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 7.0,
                            child: ListTile(
                              leading: Text("${employee.employeeList[index].id}.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                                ),
                              ),
                              title: Text("${employee.employeeList[index].name}.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  employee.employeeList[index].salary.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Container(
                                  width: 100.0,
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.thumb_up),
                                        onPressed: () {
                                          Provider.of<EmployeeModel>(context)
                                              .thumbsUp(
                                                  employee.employeeList[index].id);
                                        },
                                        color: Colors.green,
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.thumb_down),
                                        onPressed: () {
                                          Provider.of<EmployeeModel>(context)
                                              .thumbsDown(
                                                employee.employeeList[index].id);
                                        },
                                        color: Colors.red,
                                      )
                                    ],
                                  ),
                                )),
//                            margin:
//                                EdgeInsets.only(bottom: 8, left: 16, right: 16),
                          );
                        });
                  },
                )),
          )
        ],
      ),
    );
  }
}
