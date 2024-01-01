import 'package:carnova_webapp/resources/constants/imagepath.dart';
import 'package:carnova_webapp/utils/colors.dart';
import 'package:carnova_webapp/view/home_screen.dart';
import 'package:carnova_webapp/view/host/host_pending.dart';
import 'package:carnova_webapp/view/host/host_verified.dart';
import 'package:carnova_webapp/view/vehicles/verification_pending.dart';
import 'package:carnova_webapp/view/vehicles/verified_vehicles.dart';
import 'package:floating_tabbar/Models/tab_item.dart';
import 'package:floating_tabbar/Widgets/top_tabbar.dart';
import 'package:floating_tabbar/floating_tabbar.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ScreenParent extends StatefulWidget {
  int? index;
  ScreenParent({Key? key, this.index}) : super(key: key);
  @override
  State<ScreenParent> createState() => _HomeState();
}

class _HomeState extends State<ScreenParent> {
  TextStyle style1 = GoogleFonts.outfit(fontSize: 30);
  TextStyle style2 = GoogleFonts.outfit(fontSize: 20);
  List<TabItem> hostScreenTabbar() {
    List<TabItem> topTabbarTabItemlist = [
      TabItem(
        onTap: () {},
        title: Text("Verified Host", style: style2),
        tab: const VerifiedHosts(),
      ),
      TabItem(
        onTap: () {},
        title: Text("Pending Host", style: style2),
        tab: const HostPending(),
      ),
    ];
    return topTabbarTabItemlist;
  }

  List<TabItem> topTabbarTabItemlist() {
    List<TabItem> topTabbarTabItemlist = [
      TabItem(
        onTap: () {},
        title: Text("Verified Vehicles", style: style2),
        tab: const VerifiedVehicles(),
      ),
      TabItem(
        onTap: () {},
        title: Text("Pending Vehicle", style: style2),
        tab: const VehicleScreen(),
      ),
    ];
    return topTabbarTabItemlist;
  }

  Widget floatingTabBarPageView() {
    List<TabItem> tabList() {
      List<TabItem> list = [
        TabItem(
            onTap: () {},
            selectedLeadingIcon: const Icon(Icons.directions_car_outlined),
            title: Text("VEHICLES", style: style2),
            tab: const VehicleScreen()
            // TopTabBar(
            // children: topTabbarTabItemlist(),
            // indicatorColor: ColorsModel.thridColour,
            //),
            ),
        TabItem(
          title: Text("HOSTS", style: style2),
          onTap: () {},
          selectedLeadingIcon: const Icon(Icons.person),
          tab: TopTabBar(
            children: hostScreenTabbar(),
            indicatorColor: ColorsModel.thridColour,
          ),
        ),
        TabItem(
          onTap: () {},
          selectedLeadingIcon:
              const Icon(Icons.supervised_user_circle_outlined),
          title: Text("USERS", style: style2),
          tab: const HomeScreen(),
          //ba
          // badgeCount: 12,
        ),
        TabItem(
            title: Text("Settings", style: style2),
            onTap: () {},
            selectedLeadingIcon: const Icon(Icons.settings),
            tab: Center(child: Text("Settings", style: style1)))
      ];
      return list;
    }

    return FloatingTabBar(
      activeColor: Colors.grey.shade400,
      parentAppbar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout_outlined, color: Colors.red)),
          const SizedBox(width: 20)
        ],
        backgroundColor: Colors.white,
        elevation: 2,
        title: Container(
          height: MediaQuery.sizeOf(context).height / 10,
          width: MediaQuery.sizeOf(context).width / 7,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImagePaths.applogoBlack),
                  fit: BoxFit.cover)),
        ),
      ),
      useIndicator: true,
      children: tabList(),
      useNautics: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return floatingTabBarPageView();
  }
}
