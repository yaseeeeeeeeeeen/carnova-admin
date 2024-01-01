import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingWid2 extends StatelessWidget {
  LoadingWid2(
      {super.key,
      required this.color,
      required this.ontap,
      required this.text,
      required this.isLoading});
  Color color;
  String text;
  Function()? ontap;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    return ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
            fixedSize: Size(w / 4, 50), backgroundColor: color),
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(text, style: GoogleFonts.poppins()));
  }
}
