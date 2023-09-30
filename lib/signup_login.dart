
import 'package:dhan_manthan/login_signup.dart';
import 'package:dhan_manthan/personal_details_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignLog extends StatefulWidget {
  const SignLog({super.key});

  @override
  State<SignLog> createState() => _SignLogState();
}

final _formKey = GlobalKey<FormState>();
String? _emailAdress;
String? _passWord1;
String? _passWord2;
final auth = FirebaseAuth.instance;

class _SignLogState extends State<SignLog> {
  @override
  Widget build(BuildContext context) {
    void next() async {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        if (_passWord1 == _passWord2) {
          Get.off(() =>
              PersonalData(emailAdress: _emailAdress!, passWord: _passWord1!));
        } else {
          Get.snackbar('Error Occured', 'Both Passwords are not same');
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
                  flex: 2,
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
                  flex: 8,
                  child: Container(
                      // height: MediaQuery.of(context).size.height * 0.6,
                      ))
            ],
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.02,
              right: 0,
              left: 0,
              child: Image.asset(
                'assets/images/7b6f8bdf-b76e-4e95-8b9a-886a13f4acae.png',
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(55),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(76),
                            bottomRight: Radius.circular(86)),
                        color: Colors.transparent),
                  )),
              Expanded(
                  flex: 8,
                  child: Container(
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
                            const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
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
                                fillColor:
                                    const Color.fromARGB(76, 236, 233, 233),
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
                                  _passWord1 = newValue;
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
                                  _passWord2 = newValue;
                                },
                                decoration: InputDecoration(
                                  suffixIcon:
                                      const Icon(Icons.remove_red_eye_outlined),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(76, 236, 233, 233),
                                  prefixIcon: const Icon(Icons.lock_outlined),
                                  label: const Text('Confirm Password'),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(36)),
                                )),
                            const SizedBox(
                              height: 55,
                            ),
                            ElevatedButton(
                                onPressed: next,
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(22)),
                                    backgroundColor: const Color.fromRGBO(
                                        68, 149, 250, 1.0)),
                                child: const Text('Next')),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already a User ?"),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (ctx) {
                                        return const LogSign();
                                      }));
                                    },
                                    child: const Text('Login'))
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
