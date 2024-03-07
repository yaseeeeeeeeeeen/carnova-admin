import 'package:carnova_webapp/blocs/host_bloc/host_bloc.dart';
import 'package:carnova_webapp/blocs/login_bloc/login_bloc.dart';
import 'package:carnova_webapp/blocs/user_bloc/user_bloc.dart';
import 'package:carnova_webapp/blocs/vehicle_bloc/vehicle_bloc.dart';
import 'package:carnova_webapp/data/shared_preference/sharedprf.dart';
import 'package:carnova_webapp/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Sharedpref.instance.initStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        BlocProvider<VehicleBloc>(create: (context) => VehicleBloc()),
        BlocProvider<HostBloc>(create: (context) => HostBloc()),
        BlocProvider<UserBloc>(create: (context) => UserBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
