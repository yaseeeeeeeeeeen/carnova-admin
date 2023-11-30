import 'package:flutter/material.dart';

class AllVehicles extends StatelessWidget {
  const AllVehicles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(10),

      decoration: BoxDecoration(
              color: Colors.yellowAccent,
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}