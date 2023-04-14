import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/pages/splashscreen.dart';

// ignore: camel_case_types
class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

// ignore: camel_case_types
class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(Splashscreen());
          },
        ),
        elevation: 0,
        title: const Text("CampusKonnect"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 48, 45, 36)),
                  height: 230,
                  // color: Color.fromARGB(255, 78, 26, 26),
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            "assets/images/event.jpg",
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "EVENT NAME",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text(
                              "Register",
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.date_range,
                            size: 15,
                          ),
                          Text(" date of event")
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: const [
                          Expanded(
                              child: Text(
                            "awdadawd wadawdawd awddddddawdawd awdddddddddddddaw dawwwwwwwwww awdddddddd awdd awddddddd adw daw wad awd  aw da wd aw dawdaw d awd aw da wd aw dw ad ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
