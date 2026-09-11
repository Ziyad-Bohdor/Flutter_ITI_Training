import 'package:employee_app/models/employee.dart';
import 'package:flutter/material.dart';

class EmployeeGrid extends StatelessWidget {
  final List<Employee> employees;

  const EmployeeGrid({
    super.key,
    required this.employees,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),

      itemCount: employees.length,

      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.6,
      ),

      itemBuilder: (context, index) {

        Employee employee = employees[index];

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(15),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                CircleAvatar(
                  radius: 35,

                  child: Text(
                    employee.name[0],
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),

                Text(
                  employee.name,
                  textAlign: TextAlign.center,

                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                Text(
                  employee.jobTitle,
                  textAlign: TextAlign.center,
                ),

                Text(
                  employee.department,
                ),

                Text(
                  'Age: ${employee.age}',
                ),

                Text(
                  'Salary: ${employee.salary}',
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
