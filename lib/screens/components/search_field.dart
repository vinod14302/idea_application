import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading:
          false, // Set to false to hide the default leading icon

      title: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: [
              Color(0xFFF32170),
              Color(0xFFFF6B08),
              Color(0xCF23CF),
              Color(0xFFF32170),
            ],
            stops: [0.0, 0.25, 0.75, 1.0],
          ).createShader(bounds);
        },
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Align elements to the right
          children: [
            Text(
              'Integrated Data Entry Application',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Arial, Helvetica, sans-serif',
                color: Colors.white,
              ),
            ),
            _buildPopupMenuButton(context),
          ],
        ),
      ),
      titleSpacing: 0,
    );
  }

  Widget _buildWelcomeIcon() {
    return Image.network(
      'https://cdn.pixabay.com/photo/2020/07/14/13/07/icon-5404125_1280.png',
      width: 30, // Adjust the width as needed
      height: 30, // Adjust the height as needed
    );
  }

  Widget _buildPopupMenuButton(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 5),
          FaIcon(FontAwesomeIcons.userCircle),
          SizedBox(width: 5),
          Text(
            'My Profile',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Icon(Icons.arrow_drop_down),
        ],
      ),
      onSelected: (value) {
        // Handle the selected option
        if (value == 'logout') {
          // Implement logout action
        } else if (value == 'adminPanel') {
          // Implement admin panel action
        } else if (value == 'viewProfile') {
          // Implement view profile action
        } else {
          // Handle other options accordingly
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'welcome',
            child: ListTile(
              title: Row(
                children: [
                  _buildWelcomeIcon(),
                  SizedBox(width: 10),
                  Text('Welcome, User Name'),
                ],
              ),
              enabled: false,
            ),
          ),
          PopupMenuItem<String>(
            value: 'viewProfile',
            child: ListTile(
              title: Row(
                children: [
                  FaIcon(FontAwesomeIcons.userAlt),
                  SizedBox(width: 10),
                  Text('View Profile'),
                ],
              ),
            ),
          ),
          PopupMenuItem<String>(
            value: 'divider',
            child: Divider(),
          ),
          PopupMenuItem<String>(
            value: 'adminPanel',
            child: ListTile(
              title: Row(
                children: [
                  FaIcon(FontAwesomeIcons.cogs),
                  SizedBox(width: 10),
                  Text('Admin Panel'),
                ],
              ),
            ),
          ),
          PopupMenuItem<String>(
            value: 'addUser',
            child: ListTile(
              title: Row(
                children: [
                  FaIcon(FontAwesomeIcons.userPlus),
                  SizedBox(width: 10),
                  Text('Add User'),
                ],
              ),
            ),
          ),
          PopupMenuItem<String>(
            value: 'viewUsers',
            child: ListTile(
              title: Row(
                children: [
                  FaIcon(FontAwesomeIcons.users),
                  SizedBox(width: 10),
                  Text('View Users'),
                ],
              ),
            ),
          ),
          PopupMenuItem<String>(
            value: 'logout',
            child: ListTile(
              title: Row(
                children: [
                  FaIcon(FontAwesomeIcons.signOutAlt),
                  SizedBox(width: 10),
                  Text('Logout'),
                ],
              ),
            ),
          ),
        ];
      },
    );
  }
}
