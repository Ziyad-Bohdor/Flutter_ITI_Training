import 'package:employee_app/Screens/add_employee.dart';
import 'package:employee_app/Screens/employee_grid.dart';
import 'package:employee_app/Screens/employee_list.dart';
import 'package:employee_app/models/employee.dart';
import 'package:flutter/material.dart' ;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employees App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isGrid = false;

  List<Employee> employees = [
    Employee(
      name: 'Ahmed Mohamed',
      age: 25,
      salary: 12000,
      phone: '01012345678',
      email: 'ahmed@gmail.com',
      address: 'Port Said',
      department: 'IT',
      jobTitle: 'Flutter Developer',
    ),

    Employee(
      name: 'Omar Ali',
      age: 28,
      salary: 15000,
      phone: '01123456789',
      email: 'omar@gmail.com',
      address: 'Ismailia',
      department: 'HR',
      jobTitle: 'HR Manager',
    ),

    Employee(
      name: 'Mazen Hassan',
      age: 23,
      salary: 10000,
      phone: '01234567890',
      email: 'mazen@gmail.com',
      address: 'Cairo',
      department: 'Marketing',
      jobTitle: 'Marketing Specialist',
    ),

  ];

  void addEmployee(Employee employee) {
    setState(() {
      employees.add(employee);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        centerTitle: false,

        actions: [
          Row(
            children: [
              const Icon(Icons.list),

              Switch(
                value: isGrid,
                onChanged: (value) {
                  setState(() {
                    isGrid = value;
                  });
                },
              ),

              const Icon(Icons.grid_view),

              const SizedBox(width: 10),
            ],
          ),
        ],
      ),

      body: isGrid
          ? EmployeeGrid(employees: employees)
          : EmployeeList(employees: employees),

      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
          ),
        onPressed: () async {

          Employee? newEmployee = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddEmployee(),
            ),
          );

          if (newEmployee != null) {
            addEmployee(newEmployee);
          }
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}

