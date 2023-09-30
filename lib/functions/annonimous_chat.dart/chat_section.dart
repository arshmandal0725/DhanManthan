import 'dart:async';

import 'package:dhan_manthan/Providers/manthan_points.dart';
import 'package:dhan_manthan/functions/annonimous_chat.dart/chating_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatSection extends ConsumerStatefulWidget {
  const ChatSection({super.key});

  @override
  ConsumerState<ChatSection> createState() => _ChatSectionState();
}

final _formKey = GlobalKey<FormState>();
final _messageEditingController = TextEditingController();
String doubt = '';
List<Chats> chattingList = [
  Chats(
      chat: 'ABCD',
      type: 'going',
      image: 'assets/images/9308bbc2-4058-4f60-bf12-0cf66c669a66.png',
      satisfied: false),
  Chats(
      chat: 'EFGH',
      type: 'coming',
      image: 'assets/images/9308bbc2-4058-4f60-bf12-0cf66c669a66.png',
      satisfied: false),
  Chats(
      chat: 'IJKL',
      type: 'coming',
      image: 'assets/images/9308bbc2-4058-4f60-bf12-0cf66c669a66.png',
      satisfied: false),
];

class _ChatSectionState extends ConsumerState<ChatSection> {
  void addDoubt(String doub) {
    chattingList.add(Chats(
        chat: doubt,
        type: 'going',
        image: 'assets/images/9308bbc2-4058-4f60-bf12-0cf66c669a66.png',
        satisfied: false));
    setState(() {});
  }

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
                      onPressed: () {},
                      icon: const Icon(
                        Icons.info,
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
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                color: const Color.fromARGB(255, 110, 175, 255),
                child: const Center(
                    child: Text(
                  "Doubt Section",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: chattingList.map((e) {
                      if (e.type == 'going') {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 108, 184, 247),
                                      borderRadius: BorderRadius.circular(48)),
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundImage: AssetImage(e.image),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        e.chat,
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        );
                      } else {
                        return InkWell(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: (!e.satisfied)
                                      ? () {
                                          showDialog(
                                              context: context,
                                              builder: (ctx) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Have You Got your answer?'),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            e.satisfied = true;
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child:
                                                            const Text('Yes')),
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text('No'))
                                                  ],
                                                );
                                              });
                                        }
                                      : null,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: (e.satisfied)
                                              ? const Color.fromARGB(
                                                  255, 81, 124, 83)
                                              : const Color.fromARGB(
                                                  255, 167, 214, 252),
                                          borderRadius:
                                              BorderRadius.circular(48)),
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundImage:
                                                AssetImage(e.image),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            e.chat,
                                          ),
                                        ],
                                      )),
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    }).toList(),
                  ),
                ),
              )),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _messageEditingController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Write Something';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    doubt = newValue!;
                  },
                  decoration: InputDecoration(
                    hintText: 'Ask Your Doubt',
                    prefixIcon: const Icon(
                      Icons.emoji_emotions,
                      color: Color.fromRGBO(68, 149, 250, 1.0),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          addDoubt(doubt);
                          _messageEditingController.clear();
                          Timer(const Duration(milliseconds: 5), () {
                            Get.snackbar('Hurrayy....!',
                                'You got 5 points for asking doubt');
                            ref
                                .read(manthanPointsProvider.notifier)
                                .manthanPointsAdd(5);
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Color.fromRGBO(68, 149, 250, 1.0),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 0.0,
                            color: Color.fromRGBO(68, 149, 250, 1.0)),
                        borderRadius: BorderRadius.circular(48)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
