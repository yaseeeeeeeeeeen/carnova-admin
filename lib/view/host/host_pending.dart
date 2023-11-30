import 'package:flutter/material.dart';

class HostPending extends StatelessWidget {
  const HostPending({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(10),

      decoration: BoxDecoration(
              color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}