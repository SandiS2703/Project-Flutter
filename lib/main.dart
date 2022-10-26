import 'package:flutter/material.dart';
import 'package:latihan_api/employee_detail.dart';

import 'package:latihan_api/employee_form_add.dart';
import 'package:latihan_api/employee_form_edit.dart';
import 'package:latihan_api/employee_list.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aku Lelah',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const EmployeeList(),
      routes: {
        'employee_list': (context) => const EmployeeList(),
        'employee_form_add': (context) => const EmployeeFormAdd(),
        'employee_detail' :(context) => const EmployeeDetail(),
        'employee_form_edit' :(context) => const EmployeeFormEdit()
      },
    );
  }
}