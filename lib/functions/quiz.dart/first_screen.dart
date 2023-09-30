import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen(this.func, {super.key});
  final void Function() func;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(50),
          child: Image.asset(
            "assets/images/d964555c-1d0d-47d6-ae8e-e2c36529c9df.png",
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
            onPressed: func,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32)
              ),
              backgroundColor: const Color.fromRGBO(68, 149, 250, 1.0),
            ),
            icon: const Icon(Icons.arrow_right_alt_outlined),
            label: const Text("Start Quiz"))
      ],
    );
  }
}
