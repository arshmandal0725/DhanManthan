import 'package:dhan_manthan/Providers/mentor_controller.dart';
import 'package:dhan_manthan/functions/become_consultant.dart/verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

Widget widget = Container();
bool user = false;
Widget? button;
int mentorPoints = 0;
Widget _mentor = Container(
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
      const Text(':  '),
      Text(
        '$mentorPoints',
      ),
    ],
  ),
);

class _ProfilePageState extends ConsumerState<ProfilePage> {
  void show() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: const Text('Choose How You want to earn'),
            actions: [
              TextButton(
                child: const Text('As Mentor'),
                onPressed: () {
                  user = true;
                  ref.read(mentorProvider.notifier).mentorChange(_mentor);
                  widget = const Text(
                    'Alpha User',
                    style: TextStyle(fontSize: 20),
                  );

                  setState(() {});
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('As Consultant'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return const VerifyConsultant();
                  }));
                  Navigator.of(context).pop(); // Close the dialog
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (user) {
      button = const SizedBox();
    } else {
      button = ElevatedButton(
          onPressed: () {
            show();
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
              backgroundColor: Colors.blue),
          child: const Text(
            "Want to earn Money with Us",
            style: TextStyle(fontSize: 20),
          ));
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(68, 149, 250, 1.0),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(76),
                          bottomRight: Radius.circular(96))),
                )),
            Expanded(
                flex: 7,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      const SizedBox(
                        child: Text(
                          'Arsh Kumar Mandal',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      widget,
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 176, 219, 255),
                              borderRadius: BorderRadius.circular(22)),
                          child: const Text(
                            "Email :      arsh@gmail.com",
                            style: TextStyle(fontSize: 20),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 176, 219, 255),
                              borderRadius: BorderRadius.circular(22)),
                          child: const Text(
                            "Phone No. :      9098471180",
                            style: TextStyle(fontSize: 20),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 176, 219, 255),
                              borderRadius: BorderRadius.circular(22)),
                          child: const Text(
                            "Gender :      Male",
                            style: TextStyle(fontSize: 20),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                          width: double.infinity, height: 50, child: button),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
