import 'package:flutter/material.dart';

class halamanutama extends StatelessWidget {
  const halamanutama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Stopwatch", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
