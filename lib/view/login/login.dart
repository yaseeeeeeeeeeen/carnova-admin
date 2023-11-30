import 'package:carnova_webapp/resources/components/custom_textfield.dart';
import 'package:carnova_webapp/resources/components/loading_button.dart';
import 'package:carnova_webapp/resources/constants/imagepath.dart';
import 'package:carnova_webapp/resources/constants/lottiepath.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;

    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImagePaths.loginBackground), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10),
          // color: Colors.amber,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    // color: Colors.black45,
                    borderRadius: BorderRadius.circular(10)),
                height: h / 1.5,
                width: w / 2.5,
                child: Column(children: [
                  Lottie.asset(LottiePath.loginpageLottie, height: h / 2.5),
                  const SizedBox(height: 30),
                  Text(
                    "WELCOME TO CARNOVA",
                    style: GoogleFonts.outfit(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ]),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.black.withAlpha(70),
                    borderRadius: BorderRadius.circular(10)),
                height: h / 2.5,
                width: w / 2.5,
                child: Column(children: [
                  MyTextField(
                      validation: (value) {
                        return null;
                      },
                      controller: usernameController,
                      hintText: "ENTER NAME",
                      obscureText: false),
                  const SizedBox(height: 20),
                  MyTextField(
                      validation: (value) {
                        return null;
                      },
                      controller: passwordController,
                      hintText: "ENTER PASSWORD",
                      obscureText: false),
                  const SizedBox(height: 20),
                  MyLoadingButton(
                      title: "LOGIN", isLoading: false, onTap: () {
                        
                      })
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}