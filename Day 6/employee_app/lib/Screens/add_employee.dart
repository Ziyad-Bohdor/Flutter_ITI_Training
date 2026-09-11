import 'package:employee_app/models/employee.dart';
import 'package:flutter/material.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {

  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController ageController =
      TextEditingController();

  final TextEditingController salaryController =
      TextEditingController();

  final TextEditingController phoneController =
      TextEditingController();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController addressController =
      TextEditingController();

  String? selectedDepartment;
  String? selectedJobTitle;

  final List<String> departments = [
    'IT',
    'HR',
    'Marketing',
    'Finance',
    'Sales',
  ];

  final List<String> jobTitles = [
    'Flutter Developer',
    'Backend Developer',
    'Frontend Developer',
    'UI/UX Designer',
    'HR Manager',
    'Accountant',
    'Sales Manager',
  ];

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    salaryController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();

    super.dispose();
  }

  void saveEmployee() {

    if (nameController.text.trim().isEmpty ||
        ageController.text.trim().isEmpty ||
        salaryController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty ||
        selectedDepartment == null ||
        selectedJobTitle == null) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
        ),
      );

      return;
    }

    int? age = int.tryParse(
      ageController.text.trim(),
    );

    double? salary = double.tryParse(
      salaryController.text.trim(),
    );

    if (age == null || salary == null) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Age must be an integer and Salary must be a number',
          ),
        ),
      );

      return;
    }

    Employee employee = Employee(
      name: nameController.text.trim(),
      age: age,
      salary: salary,
      phone: phoneController.text.trim(),
      email: emailController.text.trim(),
      address: addressController.text.trim(),
      department: selectedDepartment!,
      jobTitle: selectedJobTitle!,
    );

    Navigator.pop(
      context,
      employee,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Add Employee'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // Name
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Age
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Age',
                prefixIcon: Icon(Icons.cake),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Salary
            TextField(
              controller: salaryController,
              keyboardType:
                  const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Salary',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Phone
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Email
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Address
            TextField(
              controller: addressController,
              keyboardType: TextInputType.streetAddress,
              decoration: const InputDecoration(
                labelText: 'Address',
                prefixIcon: Icon(Icons.location_on),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Department
            DropdownButtonFormField<String>(
              initialValue: selectedDepartment,
              decoration: const InputDecoration(
                labelText: 'Department',
                prefixIcon: Icon(Icons.business),
                border: OutlineInputBorder(),
              ),

              items: departments.map((department) {

                return DropdownMenuItem<String>(
                  value: department,
                  child: Text(department),
                );

              }).toList(),

              onChanged: (value) {

                setState(() {
                  selectedDepartment = value;
                });

              },
            ),

            const SizedBox(height: 15),

            // Job Title
            DropdownButtonFormField<String>(
              initialValue: selectedJobTitle,
              decoration: const InputDecoration(
                labelText: 'Job Title',
                prefixIcon: Icon(Icons.work),
                border: OutlineInputBorder(),
              ),

              items: jobTitles.map((jobTitle) {

                return DropdownMenuItem<String>(
                  value: jobTitle,
                  child: Text(jobTitle),
                );

              }).toList(),

              onChanged: (value) {

                setState(() {
                  selectedJobTitle = value;
                });

              },
            ),

            const SizedBox(height: 25),

            // Buttons
            Row(
              children: [
                
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: ElevatedButton(
                    onPressed: saveEmployee,
                    child: const Text('OK'),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
