import 'package:dhan_manthan/functions/become_mentor/list_modules.dart';
import 'package:dhan_manthan/functions/quiz.dart/first_screen.dart';
import 'package:dhan_manthan/functions/quiz.dart/quiz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class UnderContent extends StatefulWidget {
  const UnderContent({super.key, required this.module});
  final Module module;

  @override
  State<UnderContent> createState() => _UnderContentState();
}

class _UnderContentState extends State<UnderContent> {
  void change() {
    widget.module.moduleCount = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget button = Container();
    if (widget.module.moduleCount == 4) {
      button = ElevatedButton(
          onPressed: () {
            Get.off(() => Quiz(offQuiz: change));
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28)),
              backgroundColor: const Color.fromRGBO(68, 149, 250, 1.0)),
          child: const Text('Give Quiz'));
    }
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: const Color.fromARGB(255, 186, 215, 250)),
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                            'assets/images/7b6f8bdf-b76e-4e95-8b9a-886a13f4acae.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 70,
                          color: Colors.white60,
                          child: Center(
                            child: Text(
                              widget.module.topic,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                  children: widget.module.subTopics.map((ee) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color.fromARGB(255, 164, 214, 255)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MSHCheckbox(
                                size: 20,
                                value: ee[1],
                                colorConfig:
                                    MSHColorConfig.fromCheckedUncheckedDisabled(
                                  uncheckedColor: Colors.black,
                                  checkedColor: Colors.blue,
                                ),
                                style: MSHCheckboxStyle.stroke,
                                onChanged: (!ee[1])
                                    ? (selected) {
                                        setState(() {
                                          widget.module.moduleCount++;
                                          ee[1] = selected;
                                        });
                                      }
                                    : (selected) {}),
                            Text(ee[0]),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                );
              }).toList()),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: button,
              )
            ],
          ),
        ),
      ),
    );
  }
}
