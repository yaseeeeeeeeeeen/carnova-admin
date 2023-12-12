// ignore_for_file: use_build_context_synchronously
import 'package:carnova_webapp/bloc/host/host_bloc.dart';
import 'package:carnova_webapp/bloc/vehicle/vehicle_bloc.dart';
import 'package:carnova_webapp/data/sharedpreference/admin_token.dart';
import 'package:carnova_webapp/resources/components/navbar.dart';
import 'package:carnova_webapp/view/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // context.read<HostBloc>().add(HostFetchDataEvent());
    loginCheck(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height / 2,
          width: MediaQuery.sizeOf(context).width / 2,
          child:
              const Image(image: AssetImage('assets/images/applogoBlack.png')),
        ),
      ),
    );
  }

  loginCheck(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    final token = Sharedpref.instance.getToken();
    if (token != null) {
      context
          .read<VehicleBloc>()
          .add(VehicleFetchVehicleDataEvent(token: token));
      // context.read<HostBloc>().add(HostFetchDataEvent());

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ScreenParent()),
          (route) => false);
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}
