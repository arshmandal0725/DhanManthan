import 'package:dhan_manthan/Providers/manthan_points.dart';
import 'package:dhan_manthan/Providers/mentor_controller.dart';
import 'package:dhan_manthan/Providers/mentor_points.dart';
import 'package:flutter/material.dart';
import 'package:dhan_manthan/functions/quiz.dart/first_screen.dart';
import 'package:dhan_manthan/functions/quiz.dart/result_screen.dart';
import 'package:dhan_manthan/functions/quiz.dart/second_screen.dart';
import 'package:dhan_manthan/functions/quiz.dart/qb.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Quiz extends ConsumerStatefulWidget {
  Quiz({super.key, required this.offQuiz});
  final void Function() offQuiz;
  @override
  ConsumerState<Quiz> createState() {
    return QuizState();
  }
}

class QuizState extends ConsumerState<Quiz> {
  var x = 0;
  List<String> selectedans = [];

  void switchscreen() {
    setState(() {
      x = 1;
    });
  }

  void restart() {
    Navigator.pop(context);
    widget.offQuiz;
    if (ref.watch(ismentorProvider)) {
      ref.read(mentorPointsProvider.notifier).mentorPointsAdd(10);
      ref.read(mentorProvider.notifier).mentorChange(Container(
            height: double.infinity,
            width: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: const Color.fromARGB(255, 158, 211, 255),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 20,
                    child: Image.asset(
                        'assets/images/a57bbd9c-4117-42ee-829e-ecff55aa8139.png')),
                const Text(' :  '),
                Text(
                  '${ref.watch(mentorPointsProvider)}',
                ),
              ],
            ),
          ));
    } else {
      ref.read(manthanPointsProvider.notifier).manthanPointsAdd(10);
    }
  }

  void select(String answer) {
    selectedans.add(answer);
    if (selectedans.length == questions.length) {
      setState(() {
        x = 2;
      });
    }
  }

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Builder(builder: (context) {
                      return IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ));
                    }),
                    const SizedBox(
                      child: Row(
                        children: [
                          SizedBox(
                            height: 25,
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
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Spacer()
                  ],
                )),
              ),
              centerTitle: true,
              backgroundColor: const Color.fromRGBO(68, 149, 250, 1.0),
            ),
          ),
          body: Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 184, 223, 255)),
            child: (x == 2)
                ? ResultScreen(restart, selectedans)
                : (x == 0)
                    ? FirstScreen(switchscreen)
                    : SecondScreen(s: select),
          )),
    );
  }
}
