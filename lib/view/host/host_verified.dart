import 'package:flutter/material.dart';

class VerifiedHosts extends StatelessWidget {
  const VerifiedHosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(10),

      decoration: BoxDecoration(
              color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}