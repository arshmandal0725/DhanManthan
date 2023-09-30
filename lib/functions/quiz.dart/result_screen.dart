import "package:flutter/material.dart";
import 'package:dhan_manthan/functions/quiz.dart/qb.dart';
import 'package:dhan_manthan/functions/quiz.dart/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.func, this.choosenans, {super.key});
  final void Function() func;
  final List<String> choosenans;

  List<Map<String, Object>> getData() {
    final List<Map<String, Object>> summary = [];
    {
      for (var i = 0; i < choosenans.length; i++) {
        summary.add(
          {
            'question_index': i,
            'question': questions[i].question,
            'answer': questions[i].answers[0],
            'choosen answer': choosenans[i]
          },
        );
      }
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final x = getData();
    final total = questions.length;
    final correct = x.where((element) {
      return element['choosen answer'] == element['answer'];
    }).length;

    return Container(
      margin: const EdgeInsets.all(50),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Total $correct is correct out of $total questions. ",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            QuestionSummary(getData()),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
                onPressed: func,
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(400, 300, 200, 100)),
                icon: const Icon(Icons.restart_alt_rounded),
                label: const Text("Restart Quiz"))
          ]),
    );
  }
}
