import 'package:backet_tracket_app/Class/Budget_Tracker.dart';
import 'package:backet_tracket_app/Screen/Add_Budget_Page.dart';
import 'package:flutter/material.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {

  List<Budget> budgets = [];

  double get balance {
    double total = 0;

    for (var budget in budgets) {
      if (budget.type == "Income") {
        total += budget.amount;
      } else {
        total -= budget.amount;
      }
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true ,
        title: const Text("Budget Tracker"),
      ),

      body: Column(
        children: [

          // Current Balance
          Card(
            child: ListTile(
              title: const Text("Current Balance"),
              subtitle: Text(
                "${balance.toStringAsFixed(2)} EGP",
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: budgets.length,
              itemBuilder: (context, index) {

                Budget budget = budgets[index];

                return Card(
                  child: ListTile(
                    leading: Icon(
                      budget.type == "Income"
                          ? Icons.arrow_downward
                          : Icons.arrow_upward,
                    ),

                    title: Text(budget.name),

                    subtitle: Text(
                      "${budget.type} • ${budget.category}",
                    ),

                    trailing: Text(
                      "${budget.amount.toStringAsFixed(2)} EGP",
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
      onPressed: () async {

    Budget? budget = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const AddBudgetPage();
        },
      ),
    );

    if (budget != null) {
      setState(() {
        budgets.add(budget);
      });
    }
  },
        child: const Icon(Icons.add),
      ),
    );
  }
}