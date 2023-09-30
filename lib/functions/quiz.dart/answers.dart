import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.ans, this.ansfunc, {super.key});
  final String ans;
  final void Function() ansfunc;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: ansfunc,
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            backgroundColor: const Color.fromARGB(255, 155, 171, 217),
            foregroundColor: Colors.black),
        child: Text(
          ans,
          textAlign: TextAlign.center,
        ));
  }
}
