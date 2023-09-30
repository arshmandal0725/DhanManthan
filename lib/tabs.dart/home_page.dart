import 'package:dhan_manthan/Providers/mentor_controller.dart';
import 'package:dhan_manthan/functions/debt_tracker/debt_homescreen.dart';
import 'package:dhan_manthan/functions/module_section/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:dhan_manthan/functions/expense_tracker.dart/expense_homescreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key, required this.userType});
  final bool userType;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

int manthanPoints = 0;


class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget mentor = ref.watch(mentorProvider);
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Container(
                height: 30,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: double.infinity,
                        width: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: const Color.fromARGB(255, 158, 211, 255),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            const Text(':  '),
                            Text(
                              '$manthanPoints',
                            ),
                          ],
                        ),
                      ),
                      mentor
                    ]),
              ),
              const SizedBox(
                height: 5,
              ),
              CarouselSlider(
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color:
                                    const Color.fromARGB(255, 130, 186, 254)),
                            child: Stack(
                              children: [
                                Center(
                                  child: Image.asset((i == 1)
                                      ? 'assets/images/9070e74c-e120-4ae8-a15f-3e8f657f1642.png'
                                      : 'assets/images/7b6f8bdf-b76e-4e95-8b9a-886a13f4acae.png'),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 70,
                                    color: Colors.white60,
                                    child: const Center(
                                      child: Text(
                                        'Content Inside',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ));
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 200,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    //onPageChanged: (){},
                    scrollDirection: Axis.horizontal,
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 400,
                color: const Color.fromARGB(255, 190, 221, 247),
                child: const Center(
                  child: Text(
                    'Yaha Graph Ayga',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.09,
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (ctx) {
                                  return const Home();
                                }));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 121, 181, 255),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      'assets/images/bf2b212e-6678-4589-a716-e185f09a030a.png'),
                                ],
                              ),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Expense Tracker',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.09,
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (ctx) {
                                  return const HomeDebt();
                                }));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 121, 181, 255),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                              child: Center(
                                child: Image.asset(
                                    'assets/images/8e7e801a-5262-49d2-b691-c92c36a27cbb.png'),
                              ),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Debt Tracker',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.09,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (ctx) {
                                return const UpiPayment();
                              }));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 121, 181, 255),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            child: Center(
                              child: Image.asset(
                                  'assets/images/ad24f3e4-2a4d-4a1a-ba82-0a82627e208c.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Modules',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
