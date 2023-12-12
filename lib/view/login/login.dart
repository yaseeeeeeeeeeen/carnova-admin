import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:carnova_webapp/bloc/login/login_bloc.dart';
import 'package:carnova_webapp/bloc/vehicle/vehicle_bloc.dart';
import 'package:carnova_webapp/resources/components/custom_textfield.dart';
import 'package:carnova_webapp/resources/components/buttons/loading_button.dart';
import 'package:carnova_webapp/resources/components/navbar.dart';
import 'package:carnova_webapp/resources/constants/imagepath.dart';
import 'package:carnova_webapp/resources/constants/lottiepath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
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
                        fontSize: 28,
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
                      controller: emailController,
                      hintText: "ENTER NAME",
                      obscureText: false),
                  const SizedBox(height: 20),
                  MyTextField(
                      validation: (value) => null,
                      controller: passwordController,
                      hintText: "ENTER PASSWORD",
                      obscureText: false),
                  const SizedBox(height: 20),
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccsessState) {
                        context.read<VehicleBloc>().add(
                            VehicleFetchVehicleDataEvent(token: state.token));
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>  ScreenParent()),
                            (route) => false);
                      } else if (state is LoginFailedState) {
                        AnimatedSnackBar.material(
                          'Wrong Password',
                          type: AnimatedSnackBarType.error,
                        ).show(context);
                      }
                    },
                    builder: (context, state) {
                      return MyLoadingButton(
                          title: "LOGIN",
                          isLoading: state is LoadingState,
                          onTap: () {
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              loginButtonValidation(context);
                            } else {
                              AnimatedSnackBar.material(
                                'ADD NAME AND PASSWORD',
                                type: AnimatedSnackBarType.error,
                              ).show(context);
                            }
                          });
                    },
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  loginButtonValidation(BuildContext context) {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    final loginData = {
      'email': email,
      'password': password,
    };

    context.read<LoginBloc>().add(LoginButtonClickedEvent(data: loginData));
  }
}
