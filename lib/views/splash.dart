// ignore_for_file: use_build_context_synchronously
import 'package:carnova_webapp/blocs/host_bloc/host_bloc.dart';
import 'package:carnova_webapp/blocs/user_bloc/user_bloc.dart';
import 'package:carnova_webapp/blocs/vehicle_bloc/vehicle_bloc.dart';
import 'package:carnova_webapp/data/shared_preference/sharedprf.dart';
import 'package:carnova_webapp/views/home_screen.dart';
import 'package:carnova_webapp/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    loginCheck(context);
    return const Scaffold(
      body: Center(
        child: Text('CARNOVA'),
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
      context.read<HostBloc>().add(HostFetchDataEvent());
      context.read<UserBloc>().add(UserDataFetchEvent());
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }
}
