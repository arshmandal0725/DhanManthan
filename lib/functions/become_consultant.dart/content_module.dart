import 'package:dhan_manthan/functions/become_consultant.dart/list_modules.dart';
import 'package:flutter/material.dart';

class UnderContent extends StatefulWidget {
  const UnderContent({super.key, required this.module});
  final Module module;

  @override
  State<UnderContent> createState() => _UnderContentState();
}

class _UnderContentState extends State<UnderContent> {
  @override
  Widget build(BuildContext context) {
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
        body: Column(
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
                children: widget.module.subTopics.map((e) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 164, 214, 255)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              );
            }).toList())
          ],
        ),
      ),
    );
  }
}
