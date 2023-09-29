import 'package:flutter/material.dart';
import 'package:dhan_manthan/functions/debt_tracker/debt.dart';
import 'package:dhan_manthan/functions/debt_tracker/debt_list.dart';
import 'package:dhan_manthan/functions/debt_tracker/new_debt.dart';

class HomeDebt extends StatefulWidget {
  const HomeDebt({super.key});

  @override
  State<HomeDebt> createState() => _HomeDebtState();
}

class _HomeDebtState extends State<HomeDebt> {
  final List<Debt> expence = [];

  void add(Debt exp) {
    setState(() {
      expence.add(exp);
    });
  }

  void remove(Debt expense) {
    final indexOfExpense = expence.indexOf(expense);
    setState(() {
      expence.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      content: const Text("Debt Deleted"),
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
        "No Debt to Show,Try to add some",
        style: TextStyle(fontSize: 18),
      ),
    );
    if (expence.isNotEmpty) {
      (width <= 600)
          ? mainContent = Column(
              children: [Expanded(child: ExpenseList(expence, remove))],
            )
          : mainContent = Row(
              children: [Expanded(child: ExpenseList(expence, remove))],
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
