import 'package:dhan_manthan/functions/become_mentor/content_module.dart';
import 'package:dhan_manthan/functions/become_mentor/list_modules.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class Modules extends StatefulWidget {
  const Modules({super.key});

  @override
  State<Modules> createState() => _HomePageState();
}

class _HomePageState extends State<Modules> {
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
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  CarouselSlider(
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: const Color.fromARGB(
                                        255, 130, 186, 254)),
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
                  Column(
                      children: modules.map((e) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: InkWell(
                            onTap: () {
                              Get.to(() =>  UnderContent(module: e,));
                            },
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color:
                                      const Color.fromARGB(255, 186, 215, 250)),
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
                                          e.topic,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }).toList()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
