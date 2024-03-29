import 'package:carnova_webapp/data/shared_preference/sharedprf.dart';
import 'package:carnova_webapp/repositories/constants/colors.dart';
import 'package:carnova_webapp/views/hosts_screen.dart';
import 'package:carnova_webapp/views/login_screen.dart';
import 'package:carnova_webapp/views/users.dart';
import 'package:carnova_webapp/views/vehicle.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  List<Widget> pages = [
    const VehicleScreen(),
    const UsersScreen(),
    const HostScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              child: Column(
                children: [
                  Image.asset('assets/images/logoBlack.png'),
                  const SizedBox(height: 20),
                  buildListTile(0, Icons.directions_car, 'Vehicle'),
                  buildListTile(1, Icons.account_circle, 'Users'),
                  buildListTile(2, Icons.diversity_3, 'Hosts'),
                  buildListTile(3, Icons.logout, 'Logout')
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              color: AppColor.white,
              child: pages[index],
            ),
          )
        ],
      ),
    );
  }

  Widget buildListTile(int tabIndex, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon,
          color: index == tabIndex ? AppColor.black : AppColor.appbarGrey),
      title: Text(
        title,
        style: TextStyle(
            color: index == tabIndex ? AppColor.black : AppColor.appbarGrey),
      ),
      onTap: () {
        if (tabIndex == 3) {
          dialogBuilder(context);
        } else {
          changePage(tabIndex);
        }
      },
    );
  }

  void changePage(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  // Log out section
  dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Do you want logout your account'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Logout'),
              onPressed: () async {
                await Sharedpref.instance.removeToken();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false);
              },
            ),
          ],
        );
      },
    );
  }
}
