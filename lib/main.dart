// import 'package:carnova_webapp/utils/colors.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Carnova-Admin",
//       theme: ThemeData(
//           fontFamily: "Outfit",
//           brightness: Brightness.light,
//           primaryColor: ColorsModel.primary),
//       home: Container(color: Colors.amber),
//     );
//   }
// }

import 'package:carnova_webapp/utils/colors.dart';
import 'package:floating_tabbar/Models/tab_item.dart';
import 'package:floating_tabbar/Widgets/top_tabbar.dart';
import 'package:floating_tabbar/floating_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      
      title: 'Floating Tabbar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorsModel.primary,
        canvasColor: Colors.grey[50],
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextStyle style1 = GoogleFonts.outfit(fontSize: 30);
  TextStyle style2 = GoogleFonts.outfit();
  List<TabItem> topTabbarTabItemlist() {
    List<TabItem> topTabbarTabItemlist = [
      TabItem(
        onTap: () {},
        title: Text("Verified Vehicles", style: style2),
        tab: Center(child: Text("Verified Vehicles", style: style1)),
      ),
      TabItem(
        onTap: () {},
        title: Text("Pending Vehicle", style: style2),
        tab: Center(child: Text("Pending Vehicle", style: style1)),
      ),
    ];
    return topTabbarTabItemlist;
  }

  Widget floatingTabBarPageView() {
    List<TabItem> tabList() {
      List<TabItem> list = [
        TabItem(
          onTap: () {},
          selectedLeadingIcon: const Icon(Icons.dashboard),
          title: Text("Dashboard", style: style2),
          tab: TopTabBar(children: topTabbarTabItemlist()),
          badgeCount: 10,
        ),
        TabItem(
          onTap: () {},
          selectedLeadingIcon: const Icon(Icons.library_books),
          title: Text("Report", style: style2),
          tab: Center(child: Text("Report", style: style1)),
        ),
        TabItem(
          
          onTap: () {},
          selectedLeadingIcon: const Icon(Icons.settings),
          title: Text("Settings", style: style2),
          tab: Center(child: Text("Settings", style: style1)),
        ),
        TabItem(
          title: Text("Work", style: style2),
          onTap: () {},
          selectedLeadingIcon: const Icon(Icons.maps_home_work_sharp),
          tab: Center(child: Text("Work", style: style1)),
        ),
        TabItem(
            title: Text("ShowCase", style: style2),
            onTap: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => const ShowCase()));
            },
            selectedLeadingIcon: const Icon(Icons.flight_rounded),
            tab: Center(child: Text("ShowCase", style: style1)))
      ];
      return list;
    }

    return FloatingTabBar(
      children: tabList(),
      useNautics: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return floatingTabBarPageView();
  }
}
