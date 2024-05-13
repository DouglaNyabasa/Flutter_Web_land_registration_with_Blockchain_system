// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../../../../model/user_model.dart';
//
//
//
// class UserInfoScreen extends StatefulWidget {
//   @override
//   _UserInfoScreenState createState() => _UserInfoScreenState();
// }
//
// class _UserInfoScreenState extends State<UserInfoScreen> {
//   final LandInspectorModel model = LandInspectorModel();
//   List<LandInspector> landInspectors = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchLandInspectors();
//   }
//
//
//   void fetchLandInspectors() async {
//     try {
//       final fetchedInspectors = await model.getListOfLandInspectors();
//       setState(() {
//         landInspectors = fetchedInspectors; // Assign the fetched data to the local variable
//       });
//     } catch (e) {
//       // Handle any errors that occurred during the request
//       print('Error: $e');
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Info'),
//       ),
//     body: Center(
//     child: landInspectors.isEmpty
//     ? CircularProgressIndicator() // Show a loading indicator if data is being fetched
//         : DataTable(
//     columns: [
//     DataColumn(label: Text('Full Name')),
//     DataColumn(label: Text('Age')),
//     DataColumn(label: Text('Email')),
//     DataColumn(label: Text('ID')),
//     DataColumn(label: Text('Phone')),
//     DataColumn(label: Text('Address')),
//     ],
//     rows: landInspectors.map((inspector) {
//     return DataRow(cells: [
//     DataCell(Text(inspector.fullname)),
//     DataCell(Text(inspector.age as String)),
//     DataCell(Text(inspector.email)),
//     DataCell(Text(inspector.id)),
//     DataCell(Text(inspector.phone)),
//     DataCell(Text(inspector.address)),
//     ]);
//     }).toList(),
//     ),
//     ));
//
//   }
//
// }
//
//
