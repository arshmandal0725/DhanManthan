import 'package:dhan_manthan/homeScreen.dart';
import 'package:dhan_manthan/signup_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogSign extends StatefulWidget {
  const LogSign({super.key});

  @override
  State<LogSign> createState() => _LogSignState();
}

final _formKey = GlobalKey<FormState>();
String? _emailAdress;
String? _passWord;
final auth = FirebaseAuth.instance;

class _LogSignState extends State<LogSign> {
  @override
  Widget build(BuildContext context) {
    void login() async {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        print(_emailAdress);
        print(_passWord);
        try {
          final userCredentials = await auth
              .signInWithEmailAndPassword(
                  email: _emailAdress!, password: _passWord!)
              .then((value) {
            Get.off(()=>const HomeScreen());
          });
        } on FirebaseAuthException catch (error) {
          Get.snackbar('Error Occurred', '${error.message}');
        }
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                padding: const EdgeInsets.all(55),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(76),
                        bottomRight: Radius.circular(86)),
                    color: Color.fromRGBO(68, 149, 250, 1.0)),
              )),
              Expanded(
                  child: Container(
                      // height: MediaQuery.of(context).size.height * 0.6,
                      ))
            ],
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.13,
              right: 0,
              left: 0,
              child: Image.asset(
                'assets/images/9070e74c-e120-4ae8-a15f-3e8f657f1642.png',
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                padding: const EdgeInsets.all(55),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(76),
                        bottomRight: Radius.circular(86)),
                    color: Colors.transparent),
                child: Text(
                  'Welcome Back',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.1,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )),
              Expanded(
                  child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                    left: 40,
                    right: 40),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !value.contains('@')) {
                              return 'Enter Vallid Email Adress';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _emailAdress = newValue;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(76, 236, 233, 233),
                            prefixIcon:
                                const Icon(Icons.account_circle_outlined),
                            label: const Text('Email'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(36)),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        TextFormField(
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 6) {
                                return 'Enter Vallid PassWord';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _passWord = newValue;
                            },
                            decoration: InputDecoration(
                              suffixIcon:
                                  const Icon(Icons.remove_red_eye_outlined),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(76, 236, 233, 233),
                              prefixIcon: const Icon(Icons.lock_outlined),
                              label: const Text('Password'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(36)),
                            )),
                        const SizedBox(
                          height: 55,
                        ),
                        ElevatedButton(
                            onPressed: login,
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22)),
                                backgroundColor:
                                    const Color.fromRGBO(68, 149, 250, 1.0)),
                            child: const Text('Login')),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("New User?"),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (ctx) {
                                    return const SignLog();
                                  }));
                                },
                                child: const Text('SignUp'))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
