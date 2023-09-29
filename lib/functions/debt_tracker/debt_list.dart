import 'package:dhan_manthan/functions/debt_tracker/debt.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(this.expences, this.removeThis, {super.key});
  final List<Debt> expences;
  final void Function(Debt expense) removeThis;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expences.length,
        itemBuilder: (context, index) {
          return Dismissible(
            onDismissed: (direction) => removeThis(expences[index]),
            key: ValueKey(expences[index]),
            child: Card(
                color: const Color.fromARGB(255, 131, 184, 248),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Text(
                              expences[index].title,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.currency_rupee),
                          const SizedBox(
                            width: 3,
                          ),
                          Expanded(child: Text('${expences[index].amount}')),
                          const Spacer(),
                          const SizedBox(width: 3),
                          Text('${expences[index].formattedDate}')
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                )),
          );
        });
  }
}
