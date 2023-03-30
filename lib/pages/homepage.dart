import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final int days = 30;
  final String name = "codeee";

  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Catalog App")),
      ),
      body: Center(
        child: Text("Welcome $days and $name"),
      ),
      // drawer: Drawer(),
    );
  }
}
