import 'package:flutter/material.dart';
import 'package:dhan_manthan/functions/expense_tracker.dart/expense.dart';
import 'package:dhan_manthan/functions/expense_tracker.dart/expense_list.dart';
import 'package:dhan_manthan/functions/expense_tracker.dart/new_expense.dart';
import 'package:dhan_manthan/functions/expense_tracker.dart/chart/chart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Expense> expence = [];

  void add(Expense exp) {
    setState(() {
      expence.add(exp);
    });
  }

  void remove(Expense expense) {
    final indexOfExpense = expence.indexOf(expense);
    setState(() {
      expence.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      content: const Text("Expense Deleted"),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              expence.insert(indexOfExpense, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text(
        "No Expences to Show,Try to add some",
        style: TextStyle(fontSize: 18),
      ),
    );
    if (expence.isNotEmpty) {
      (width <= 600)
          ? mainContent = Column(
              children: [
                Chart(expenses: expence),
                Expanded(child: ExpenseList(expence, remove))
              ],
            )
          : mainContent = Row(
              children: [
                Expanded(child: Chart(expenses: expence)),
                Expanded(child: ExpenseList(expence, remove))
              ],
            );
    }
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(builder: (context) {
                      return IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 25,
                          ));
                    }),
                    const SizedBox(
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20,
                            child: Image(
                              image: AssetImage(
                                  'assets/images/dhan_manthan__4_-removebg-preview.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'DHAN MANTHAN',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          (width <= 600)
                              ? showModalBottomSheet(
                                  context: context,
                                  builder: (ctx) {
                                    return NewExpense(add);
                                  })
                              : showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (ctx) {
                                    return NewExpense(add);
                                  });
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 25,
                        ))
                  ],
                )),
              ),
              centerTitle: true,
              backgroundColor: const Color.fromRGBO(68, 149, 250, 1.0),
            ),
          ),
          body: mainContent),
    );
  }
}
