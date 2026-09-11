import 'package:backet_tracket_app/Class/Budget_Tracker.dart';
import 'package:flutter/material.dart';

class AddBudgetPage extends StatefulWidget {
  const AddBudgetPage({super.key});

  @override
  State<AddBudgetPage> createState() => _AddBudgetPageState();
}

class _AddBudgetPageState extends State<AddBudgetPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController otherController = TextEditingController();

  String selectedType = "Income";
  String selectedCategory = "Salary";

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    otherController.dispose();
    super.dispose();
  }

  void addBudget() {
    if (nameController.text.isEmpty ||
        amountController.text.isEmpty) {
      return;
    }

    double? amount = double.tryParse(amountController.text);

    if (amount == null) {
      return;
    }

    String category = selectedCategory;

    if (selectedCategory == "Other") {
      if (otherController.text.isEmpty) {
        return;
      }

      category = otherController.text;
    }

    Budget budget = Budget(
      name: nameController.text,
      amount: amount,
      type: selectedType,
      category: category,
    );

    Navigator.pop(context, budget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Budget"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // Name
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Amount
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Amount",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Type
            DropdownButtonFormField<String>(
              value: selectedType,

              decoration: const InputDecoration(
                labelText: "Type",
                border: OutlineInputBorder(),
              ),

              items: const [
                DropdownMenuItem(
                  value: "Income",
                  child: Text("Income"),
                ),

                DropdownMenuItem(
                  value: "Outcome",
                  child: Text("Outcome"),
                ),
              ],

              onChanged: (value) {
                setState(() {
                  selectedType = value!;
                });
              },
            ),

            const SizedBox(height: 15),

            // Category
            DropdownButtonFormField<String>(
              value: selectedCategory,

              decoration: const InputDecoration(
                labelText: "Category",
                border: OutlineInputBorder(),
              ),

              items: const [
                DropdownMenuItem(
                  value: "Salary",
                  child: Text("Salary"),
                ),

                DropdownMenuItem(
                  value: "Food",
                  child: Text("Food"),
                ),

                DropdownMenuItem(
                  value: "Transportation",
                  child: Text("Transportation"),
                ),

                DropdownMenuItem(
                  value: "Bills",
                  child: Text("Bills"),
                ),

                DropdownMenuItem(
                  value: "Other",
                  child: Text("Other"),
                ),
              ],

              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),

            const SizedBox(height: 15),

            // Other Category
            if (selectedCategory == "Other")
              TextField(
                controller: otherController,
                decoration: const InputDecoration(
                  labelText: "Enter Category",
                  border: OutlineInputBorder(),
                ),
              ),

            const SizedBox(height: 20),

            // Add Button
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: addBudget,
                child: const Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}