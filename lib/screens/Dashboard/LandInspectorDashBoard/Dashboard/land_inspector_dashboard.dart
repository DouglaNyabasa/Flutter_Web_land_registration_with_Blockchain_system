// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class LandInspectorDashBoard extends StatefulWidget {
//   const LandInspectorDashBoard({super.key});
//
//   @override
//   State<LandInspectorDashBoard> createState() => _LandInspectorDashBoardState();
// }
//
// class _LandInspectorDashBoardState extends State<LandInspectorDashBoard> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(CupertinoIcons.arrow_left,color: Colors.white,)),
//         backgroundColor: const Color(0xFF272D34),
//         title: const Text('LandInspector DashBoard',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../UserDashBoard/AddLand/add_land.dart';
import '../../UserDashBoard/LandGallery/land_gallery.dart';
import '../../UserDashBoard/MyLand/my_land.dart';
import '../../UserDashBoard/MyReceivedRequest/my_received_request_screen.dart';
import '../../UserDashBoard/MySentRequest/my_sent_request_screen.dart';

class LandInspectorDashBoard extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<LandInspectorDashBoard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    AddLandScreen(),
    MyLandScreen(land: null,),
    MyLand(),
    MySenRequestScreen(requested_lands: [],),
    MySentRequestScreen(requested_lands: [],)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFCDA379),
      appBar: AppBar(
        backgroundColor:Color(0xFFCDA379),
        elevation: 0,
        title:  Text('LandInspector DashBoard',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
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
                    'Land Inspector',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {
                _navigateToScreen(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.verified),
              title: Text('Verify Land'),
              onTap: () {
                _navigateToScreen(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.swap_horizontal_circle),
              title: Text('Transfer Ownership'),
              onTap: () {
                _navigateToScreen(3);
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