

import 'package:blockchain_landregistry1/routing/app_route_config.dart';
import 'package:blockchain_landregistry1/screens/Auth/ContractorAuth/contractor_signin.dart';
import 'package:blockchain_landregistry1/screens/Dashboard/ContractorDashboard/AddLandInspector/add_land_inspector.dart';
import 'package:blockchain_landregistry1/screens/Dashboard/ContractorDashboard/Dashboard/contractor_dashboard.dart';
import 'package:blockchain_landregistry1/screens/Dashboard/ContractorDashboard/GetAllLandInspector/all_land_inspectors.dart';
import 'package:blockchain_landregistry1/screens/Dashboard/ContractorDashboard/GetAllLandInspector/getlandinspector_new.dart';
import 'package:blockchain_landregistry1/screens/HomeScreen/home_page.dart';




import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  Get.put(MenuController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:  HomePage(),

      // routeInformationParser: MyAppRouter().goRouter.routeInformationParser,
      // routerDelegate: MyAppRouter().goRouter.routerDelegate,
    );
  }
}


