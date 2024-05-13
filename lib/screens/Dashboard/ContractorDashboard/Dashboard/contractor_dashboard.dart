
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Auth/UserAuth/SigninScreen/logout.dart';
import '../../UserDashBoard/AddLand/add_land.dart';
import '../../UserDashBoard/LandGallery/land_gallery.dart';
import '../../UserDashBoard/MyLand/my_land.dart';
import '../../UserDashBoard/MyReceivedRequest/my_received_request_screen.dart';
import '../../UserDashBoard/MySentRequest/my_sent_request_screen.dart';
import '../AddLandInspector/add_land_inspector.dart';
import '../GetAllLandInspector/all_land_inspectors.dart';

class ContractorDashBoard extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<ContractorDashBoard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    AddLandInspector(),
    GetAllLandInspectorsScreen(),
    LogoutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFCDA379),
      appBar: AppBar(
        backgroundColor:Color(0xFFCDA379),
        elevation: 0,
        title:  Text('Contractor DashBoard',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
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
                    'Contractor',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.person_add_solid),
              title: Text('Add Land Inspector'),
              onTap: () {
                _navigateToScreen(0);
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.person_2_fill),
              title: Text('All Land Inspectors'),
              onTap: () {
                _navigateToScreen(1);
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


