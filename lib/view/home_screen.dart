import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle style1 = GoogleFonts.outfit(fontSize: 18);
    // double h = MediaQuery.sizeOf(context).height;
    // double w = MediaQuery.sizeOf(context).width;
    return Center(
      child: Text("Home Screen", style: style1),
    );
  }
}
