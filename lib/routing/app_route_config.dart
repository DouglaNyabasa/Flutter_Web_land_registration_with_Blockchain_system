// import 'dart:js';
//
//
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// import '../screens/Auth/ContractorAuth/contractor_signin.dart';
// import '../screens/Auth/InspectorAuth/landinspector_login.dart';
// import '../screens/HomeScreen/home_screen.dart';
// import 'app_route_constants.dart';
//
// class MyAppRouter {
//
//   GoRouter goRouter = GoRouter(
//       routes: [
//         GoRoute(
//           name: MyAppRouteConstants.homeRouteName,
//           path: '/',
//           pageBuilder: (context, state){
//             return MaterialPage(child: HomeScreen());
//           }
//         ),
//         GoRoute(
//             name: MyAppRouteConstants.landContractorSignInRouteName,
//             path: '/LandInspectorSignIn',
//             pageBuilder: (context, state){
//               return MaterialPage(child: LandInspectorSignIn());
//             }
//         ),
//         GoRoute(
//             name: MyAppRouteConstants.contractorSignInRouteName,
//             path: '/ContractorSignIn',
//             pageBuilder: (context, state){
//               return MaterialPage(child: ContractorSignIn());
//             }
//         ),
//         GoRoute(
//             name: MyAppRouteConstants.userSignInRouteName,
//             path: '/SignInScreen',
//             pageBuilder: (context, state){
//               return MaterialPage(child: SignInScreen());
//             }
//         ),
//         GoRoute(
//             name: MyAppRouteConstants.userRegisterRouteName,
//             path: '/RegisterUserScreen',
//             pageBuilder: (context, state){
//               return MaterialPage(child: RegisterUserScreen());
//             }
//         ),
//       ]);
// }