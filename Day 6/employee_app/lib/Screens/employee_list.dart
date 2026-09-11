
import 'package:employee_app/models/employee.dart';
import 'package:flutter/material.dart';

class EmployeeList extends StatelessWidget {
  final List<Employee> employees;

  const EmployeeList({
    super.key,
    required this.employees,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),

      itemCount: employees.length,

      itemBuilder: (context, index) {

        Employee employee = employees[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 12),

          child: Padding(
            padding: EdgeInsets.all(10) ,
            child: ListTile(

            leading: CircleAvatar(
              child: Text(
                employee.name[0],
              ),
            ),

            title: Text(
              employee.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 5),

                Text(
                  '${employee.jobTitle} - ${employee.department}',
                ),
                const SizedBox(height: 5),

                Text(
                  'Age: ${employee.age}',
                ),
                const SizedBox(height: 5),

                Text(
                  'Salary: ${employee.salary}',
                ),
                
              ],
            ),

            isThreeLine: true,

            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ),
            )
        );
      },
    );
  }
}
