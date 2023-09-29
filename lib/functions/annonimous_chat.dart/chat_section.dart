import 'package:dhan_manthan/functions/annonimous_chat.dart/chating_model.dart';
import 'package:flutter/material.dart';

class ChatSection extends StatefulWidget {
  const ChatSection({super.key});

  @override
  State<ChatSection> createState() => _ChatSectionState();
}

final _formKey = GlobalKey<FormState>();
final _messageEditingController = TextEditingController();
String doubt = '';
List<Chats> chattingList = [
  const Chats(
      chat: 'ABCD',
      type: 'going',
      image: 'assets/images/9308bbc2-4058-4f60-bf12-0cf66c669a66.png'),
  const Chats(
      chat: 'EFGH',
      type: 'coming',
      image: 'assets/images/9308bbc2-4058-4f60-bf12-0cf66c669a66.png'),
  const Chats(
      chat: 'IJKL',
      type: 'coming',
      image: 'assets/images/9308bbc2-4058-4f60-bf12-0cf66c669a66.png'),
];

class _ChatSectionState extends State<ChatSection> {
  void addDoubt(String doub) {
    chattingList.add(Chats(
        chat: doubt,
        type: 'going',
        image: 'assets/images/9308bbc2-4058-4f60-bf12-0cf66c669a66.png'));
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
                        return Align(
                          alignment: Alignment.topRight,
                          child: Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 167, 214, 252),
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
