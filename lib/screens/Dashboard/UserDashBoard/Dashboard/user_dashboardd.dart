
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Auth/UserAuth/SigninScreen/logout.dart';
import '../AddLand/add_land.dart';
import '../LandGallery/land_gallery.dart';
import '../MyLand/my_land.dart';
import '../MyReceivedRequest/my_received_request_screen.dart';
import '../MySentRequest/my_sent_request_screen.dart';


class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    AddLandScreen(),
    MyLandScreen(land: null,),
    MyLand(),
    MySenRequestScreen(requested_lands: [],),
    MySentRequestScreen(requested_lands: [],),
    LogoutScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFCDA379),
      appBar: AppBar(
        backgroundColor:Color(0xFFCDA379),
        elevation: 0,
        title:  Text('User DashBoard',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child:
              Column(
                children: [
                  Icon((Icons.person),size: 75,),
                  Text(
                      'LandOwner',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),

              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon( Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {
                _navigateToScreen(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.landscape_outlined),
              title: Text('Add Land'),
              onTap: () {
                _navigateToScreen(1);
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.photo),
              title: Text('Land Gallery'),
              onTap: () {
                _navigateToScreen(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.landscape_outlined),
              title: Text('My Land'),
              onTap: () {
                _navigateToScreen(3);
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('My Received Request'),
              onTap: () {
                _navigateToScreen(4);
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('My Sent Land Request'),
              onTap: () {
                _navigateToScreen(5);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                _navigateToScreen(6);
              },
            ),
          ],
        ),
      ),
      body: _screens[_currentIndex],
    );
  }

  void _navigateToScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
    Navigator.pop(context); // Close the drawer
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
