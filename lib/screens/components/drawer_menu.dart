import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/screens/components/drawer_list_tile.dart';
import 'package:responsive_admin_dashboard/screens/platform/increase_platform.dart';
import 'package:responsive_admin_dashboard/screens/platform/p_mod_form.dart';
import 'package:responsive_admin_dashboard/screens/platform/pview.dart';
import 'package:responsive_admin_dashboard/screens/dash_board_screen.dart';
import 'package:responsive_admin_dashboard/screens/station/add_station.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(appPadding),
            child: Image.asset("assets/images/logowithtext.png"),
          ),
          DrawerListTile(
            title: 'Home',
            svgSrc: 'assets/icons/Dashboard.svg',
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pview()),
              );
            },
          ),
          DrawerListTile(
            title: 'Platform',
            svgSrc: 'assets/icons/platform.svg',
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IncreasePlatform()),
              );
            },
            subItems: [
              DrawerListTile(
                title: 'Increase Platform',
                svgSrc: 'assets/icons/Statistics.svg',
                tap: () {
                  // Handle 'Increase Platform' tap
                },
              ),
              DrawerListTile(
                title: 'View/Edit',
                svgSrc: 'assets/icons/Statistics.svg',
                tap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IncreasePlatform()),
                  );
                },
              ),
              DrawerListTile(
                title: 'Division Wise',
                svgSrc: 'assets/icons/Statistics.svg',
                tap: () {
                  // Handle 'Division Wise Changes' tap
                },
              ),
            ],
          ),
          DrawerListTile(
            title: 'Station',
            svgSrc: 'assets/icons/Message.svg',
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddStation(


                  
                )),
              );
            },
          ),
          DrawerListTile(
            title: 'ID Cards',
            svgSrc: 'assets/icons/Statistics.svg',
            tap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ModifyPlatform()),
              );
            },
          ),
          DrawerListTile(
            title: 'Location',
            svgSrc: 'assets/icons/Statistics.svg',
            tap: () {},
          ),
          DrawerListTile(
            title: 'Terminal',
            svgSrc: 'assets/icons/Statistics.svg',
            tap: () {},
          ),
          DrawerListTile(
            title: 'Operator',
            svgSrc: 'assets/icons/Statistics.svg',
            tap: () {},
          ),
          DrawerListTile(
            title: 'SRM',
            svgSrc: 'assets/icons/Statistics.svg',
            tap: () {},
          ),
          DrawerListTile(
            title: 'RBS',
            svgSrc: 'assets/icons/Statistics.svg',
            tap: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),
            child: Divider(
              color: grey,
              thickness: 0.2,
            ),
          ),
          /* DrawerListTile(
              title: 'Settings',
              svgSrc: 'assets/icons/Setting.svg',
              tap: () {}),


          DrawerListTile(
              title: 'Logout', svgSrc: 'assets/icons/Logout.svg', tap: () {}),*/
        ],
      ),
    );
  }
}
