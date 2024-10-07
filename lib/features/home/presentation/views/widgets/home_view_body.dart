import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'home',
        style: TextStyle(color: Colors.amber, fontSize: 40),
      )),
    );
  }
}
