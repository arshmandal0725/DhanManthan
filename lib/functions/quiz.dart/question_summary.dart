import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summarydata, {super.key});
  final List<Map<String, Object>> summarydata;

  @override
  Widget build(BuildContext context) {
    Color bg;
    var value;
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.map((e) {
            value = e['choosen answer'] == e['correct'];
            bg = (value)
                ? const Color.fromARGB(255, 216, 240, 202)
                : const Color.fromARGB(255, 196, 140, 140);

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: bg,
                  radius: 10,
                  child: Text(
                    ((e['question_index'] as int) + 1).toString(),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e['question'] as String,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          e['choosen answer'] as String,
                          style: TextStyle(color: bg),
                        ),
                        const SizedBox(height: 5),
                        Text(e['answer'] as String,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                        const SizedBox(
                          height: 20,
                        )
                      ]),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
