import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:latihan_api/employee_model.dart';

import 'restapi.dart';

class EmployeeList extends StatefulWidget{
  const EmployeeList({Key? key}) : super(key: key);

  @override
    EmployeeListState createState() => EmployeeListState();
}

class EmployeeListState extends State<EmployeeList> {
  DataService ds = DataService();

  List data = [];
  List<EmployeeModel> employee = [];

  selectAllEmployee() async {
    data = jsonDecode(await ds.selectAll('63476a7599b6c11c094bd4ff', 'office', 
    'employee', '63476cf199b6c11c094bd5f2'));
    employee = data.map((e) => EmployeeModel.fromJson(e)).toList();

    setState(() {
      employee = employee;
    });
  }

  FutureOr reloadDataEmployee(dynamic value){
    setState(() {
      selectAllEmployee();
    });
  }

  @override
  void initState(){
    selectAllEmployee();

    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title:  const Text("List Karyawan Lelah"),
        backgroundColor: Colors.indigo  ,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:20.0),
            child:GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'employee_form_add').then(reloadDataEmployee);
              },
              child: const Icon(
                Icons.add,
                size: 26.0,
              ),
            )
          ),
        ],
      ),
      body: ListView.builder(
        //Let the listview know how many items its need to build.
        itemCount: employee.length,
        //provide a builder function. this is where the magic happen

        itemBuilder: (context, index) {
          final item = employee[index];

          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.birthday),
            onTap: (){
              Navigator.pushNamed(context, 'employee_detail',
                  arguments: [item.id]).then(reloadDataEmployee);
            },
          );
        },
      ),
    );
  }
}