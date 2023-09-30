import 'package:dhan_manthan/functions/annonimous_chat.dart/chat_section.dart';
import 'package:dhan_manthan/tabs.dart/consultant.dart';
import 'package:dhan_manthan/tabs.dart/home_page.dart';
import 'package:dhan_manthan/tabs.dart/news.dart';
import 'package:dhan_manthan/tabs.dart/profilepage.dart';
import 'package:dhan_manthan/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool type = false;
final iconList = [
  Icons.home,
  Icons.people,
  Icons.newspaper,
  Icons.account_circle,
];
var _bottomNavIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final tabs = [
      HomePage(userType: type),
      const ConsultantPage(),
      const NewsPage(),
      const ProfilePage()
    ];
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
                            Scaffold.of(context).openDrawer();
                          },
                          icon: const Icon(
                            Icons.menu,
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
          drawer: const Drawer(
            child: MainDrawer(),
          ),
          body: tabs[_bottomNavIndex],
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromRGBO(68, 149, 250, 1.0),
            onPressed: () {
              Get.to(const ChatSection());
            },
            child: const Icon(
              Icons.chat_bubble,
              size: 27,
            ),
            //params
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            iconSize: 30,
            backgroundColor: const Color.fromRGBO(68, 149, 250, 1.0),
            leftCornerRadius: 0,
            rightCornerRadius: 0,
            activeColor: Colors.white,
            icons: iconList,
            inactiveColor: const Color.fromARGB(255, 24, 63, 110),
            activeIndex: _bottomNavIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.smoothEdge,
            onTap: (index) => setState(() => _bottomNavIndex = index),
            //other params
          )),
    );
  }
}
