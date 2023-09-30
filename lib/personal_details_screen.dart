import 'dart:convert';

import 'package:dhan_manthan/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PersonalData extends StatefulWidget {
  const PersonalData(
      {super.key, required this.emailAdress, required this.passWord});
  final String emailAdress;
  final String passWord;

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

final _formKey = GlobalKey<FormState>();
String? _name;
String? _phoneNumber;
String? _gender;
var user = '';
final auth = FirebaseAuth.instance;

class _PersonalDataState extends State<PersonalData> {
  void storeData() {
    final url = Uri.https(
        'dhan-manthan-default-rtdb.firebaseio.com', 'PersonalData.json');
    http.post(url,
        body: json.encode({
          'name': _name,
          'phone number': _phoneNumber,
          'gender': _gender,
          'modules': 0,
          'payment': 'NO',
          'email': widget.emailAdress,
        }));
  }

  @override
  Widget build(BuildContext context) {
    void SignUp() async {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        try {
          final userCredentials = await auth
              .createUserWithEmailAndPassword(
                  email: widget.emailAdress, password: widget.passWord)
              .then((value) {
            storeData();
            Get.off(() => const HomeScreen());
          });
          print(userCredentials);
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
                              'Person Details',
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Vallid Name';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                _name = newValue;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(76, 236, 233, 233),
                                prefixIcon:
                                    const Icon(Icons.account_circle_outlined),
                                label: const Text('Name'),
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
                                      value.length < 10) {
                                    return 'Enter Vallid Phone Number';
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  _phoneNumber = newValue;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(76, 236, 233, 233),
                                  prefixIcon: const Icon(Icons.phone_android),
                                  label: const Text('Phone Number'),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(36)),
                                )),
                            const SizedBox(
                              height: 35,
                            ),
                            TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Vallid PassWord';
                                  }

                                  return null;
                                },
                                onSaved: (newValue) {
                                  _gender = newValue;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(76, 236, 233, 233),
                                  prefixIcon: const Icon(Icons.person),
                                  label: const Text('Gender'),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(36)),
                                )),
                            const SizedBox(
                              height: 55,
                            ),
                            ElevatedButton(
                                onPressed: SignUp,
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(22)),
                                    backgroundColor: const Color.fromRGBO(
                                        68, 149, 250, 1.0)),
                                child: const Text('SignUp')),
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
