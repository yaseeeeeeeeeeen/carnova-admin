import 'package:carnova_webapp/resources/constants/text_styles.dart';
import 'package:carnova_webapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLoadingButton extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final bool isLoading;
  const MyLoadingButton(
      {super.key, this.onTap, required this.title, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: 52,
        padding: const EdgeInsets.only(left: 20, right: 20),
        // margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: ColorsModel.thridColour,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: isLoading
              ? Transform.scale(
                  scale: 0.5,
                  child: const CircularProgressIndicator(color: Colors.white))
              : Text(title,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  )),
        ),
      ),
    );
  }
}

class SubLoadingButton extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final bool isLoading;
  const SubLoadingButton(
      {super.key, this.onTap, required this.title, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: heigth / 16,
        width: width / 10,
        padding: const EdgeInsets.only(left: 20, right: 20),
        // margin: const EdgeInsets.symmetric(horizontal: 25),a
        decoration: BoxDecoration(
          color: ColorsModel.thridColour,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: isLoading
              ? Transform.scale(
                  scale: 0.5,
                  child: const CircularProgressIndicator(color: Colors.white))
              : Text(title, style: Fontstyles.buttonText),
        ),
      ),
    );
  }
}
