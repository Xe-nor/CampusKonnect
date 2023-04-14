import 'package:flutter/material.dart';

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
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 20,
                top: 70,
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
                  ],
                )),
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 320,
                child: Image.asset(
                  "assets/images/event.jpg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
                top: 330,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Color(0xff22222C),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            "EVENT-NAME",
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
                            "date and time",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.bookmark_add, color: Colors.white),
                          Text(
                            "location",
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
                      Row(
                        children: [
                          IconButton(
                            style: const ButtonStyle(),
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border_outlined),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
