import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(10),

      decoration: BoxDecoration(
              color: Colors.amber,
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}
