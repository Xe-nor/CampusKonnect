import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  final int days = 30;
  final String name = "codeee";
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
