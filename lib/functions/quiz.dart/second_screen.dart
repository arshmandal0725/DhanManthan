import 'package:flutter/material.dart';
import 'package:dhan_manthan/functions/quiz.dart/answers.dart';
import 'package:dhan_manthan/functions/quiz.dart/qb.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.s});
  final void Function(String answer) s;
  @override
  State<StatefulWidget> createState() {
    return SecondScreenState();
  }
}

class SecondScreenState extends State<SecondScreen> {
  var index = 0;
  void currentindex(String ans) {
    widget.s(ans);
    setState(() {
      index = index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final current = questions[index];
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            current.question,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          ...current.shuffele().map((e) {
            return AnswerButton(e, () {
              currentindex(e);
            });
          })
        ],
      ),
    );
  }
}
