import 'package:flutter/material.dart';

class VerifiedVehicles extends StatelessWidget {
  const VerifiedVehicles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(10),

      decoration: BoxDecoration(
              color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}