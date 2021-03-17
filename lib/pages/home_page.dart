import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.purple, child: Text("Catelog")),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to my flutter development "),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
