import 'package:flutter/material.dart';

class PendingVerification extends StatelessWidget {
  const PendingVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(10),

      decoration: BoxDecoration(
              color: Colors.redAccent,
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}