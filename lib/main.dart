import 'package:carnova_webapp/bloc/host/host_bloc.dart';
import 'package:carnova_webapp/bloc/login/login_bloc.dart';
import 'package:carnova_webapp/bloc/vehicle/vehicle_bloc.dart';
import 'package:carnova_webapp/data/sharedpreference/admin_token.dart';

import 'package:carnova_webapp/utils/colors.dart';
import 'package:carnova_webapp/view/login/login.dart';
import 'package:carnova_webapp/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Sharedpref.instance.initStorage();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginBloc(),
          ),
          BlocProvider(create: (context) => VehicleBloc()),
          BlocProvider(create: (context) => HostBloc())
        ],
        child: MaterialApp(
          title: 'Carnova-Admin',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: ColorsModel.primary,
              canvasColor: Colors.grey.shade300),
          home: SplashScreen(),
        ));
  }
}
