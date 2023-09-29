import 'package:dhan_manthan/login_signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Color.fromRGBO(34, 85, 147, 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.currency_rupee_outlined,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Dhan Manthan",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            )),
        ListTile(
            leading: Icon(
              Icons.settings,
              size: 30,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Settings",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {}),
        ListTile(
            leading: Icon(
              Icons.logout,
              size: 30,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Logout",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                Get.off(() => const LogSign());
              });
            }),
        /*ListTile(
          leading: Icon(
            Icons.logout,
            size: 30,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: Text(
            "Back",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        )*/
      ],
    );
  }
}
