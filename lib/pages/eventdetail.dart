import 'package:flutter/material.dart';
import 'package:campuskonnect/pages/homepage.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class eventdetail extends StatefulWidget {
  const eventdetail({super.key});

  @override
  State<eventdetail> createState() => _eventdetailState();
}

// ignore: camel_case_types
class _eventdetailState extends State<eventdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  // height: 300,
                  child: Image.asset(
                    "assets/images/event.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 0,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.to(const Homepage());
                        },
                        icon: const Icon(Icons.menu))
                  ],
                ),
              ),
              Positioned(
                  top: 200,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 29, 29, 51),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "EVENT-NAME",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: const [
                              Icon(Icons.date_range, color: Colors.grey),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  "date and time",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: Colors.white),
                              Text(
                                "location",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Row(
                            children: const [
                              Text(
                                "MORE INFORMATION",
                                style: TextStyle(fontSize: 30),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const [
                              Icon(Icons.bookmark_add, color: Colors.white),
                              Text(
                                "TOTAL-TIME",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.bookmark_add, color: Colors.white),
                              Text(
                                "BATCH",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Row(
                            children: const [
                              Text(
                                "DESCRIPTION",
                                style: TextStyle(fontSize: 30),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          Positioned(
                            bottom: 0,
                            left: 10,
                            child: Row(
                              children: [
                                IconButton(
                                  style: const ButtonStyle(),
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.favorite_border_outlined),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
