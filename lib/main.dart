import 'package:carnova_webapp/resources/components/navbar.dart';
import 'package:carnova_webapp/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
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
    return MaterialApp(
      title: 'Carnova-Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: ColorsModel.primary,
          canvasColor: Colors.grey.shade300),
      home: const ScreenParent(),
    );
  }
}
