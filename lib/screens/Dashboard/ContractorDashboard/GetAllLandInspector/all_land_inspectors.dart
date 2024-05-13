import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../model/users_model.dart';
import '../AddLandInspector/add_land_inspector.dart';


class GetAllLandInspectorsScreen extends StatefulWidget {


  GetAllLandInspectorsScreen();

  @override
  _GetAllLandInspectorsScreenState createState() => _GetAllLandInspectorsScreenState();
}

class _GetAllLandInspectorsScreenState extends State<GetAllLandInspectorsScreen> {

  List<User> _users = [];
  bool _isLoading = false;

  Future<void> _fetchUsers() async {
    setState(() {
      _isLoading = true;
    });

    final url = 'http://localhost/block_backend/public/inspectors'; // Replace with your API endpoint

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> jsonUsers = json.decode(response.body);
        setState(() {
          _users = jsonUsers.map((jsonUser) => User.fromJson(jsonUser)).toList();
        });
      } else {
        // Error occurred while fetching users
        // You can handle the error as per your requirement
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Failed to fetch users. Please try again later.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      // Exception occurred during the HTTP request
      // Handle the exception here, such as displaying an error message
      print('Exception occurred: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }




  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  // void _removeUser(int index) {
  //   setState(() {
  //     widget.persons.removeAt(index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCDA379),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("All Land Inspectors",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body:_isLoading
          ? Center(child: CircularProgressIndicator())
          : DataTable(
        columns: [
                  DataColumn(label: Text('Full Name',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,fontStyle: FontStyle.normal),)),
                  DataColumn(label: Text('Age',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,fontStyle: FontStyle.normal),)),
                  DataColumn(label: Text('Email',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,fontStyle: FontStyle.normal),)),
                  DataColumn(label: Text('ID',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,fontStyle: FontStyle.normal),)),
                  DataColumn(label: Text('Phone',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,fontStyle: FontStyle.normal),)),
                  DataColumn(label: Text('Address',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,fontStyle: FontStyle.normal),)),
                  DataColumn(label: Text('Remove',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,fontStyle: FontStyle.normal),)),
                ],
              rows: _users.map((user) {
                return DataRow(
                  cells: [
                    DataCell(Text(user.fullName)),
                    DataCell(Text(user.address)),
                    DataCell(Text(user.age.toString())),
                    DataCell(Text(user.email)),
                    DataCell(Text(user.id.toString())),
                    DataCell(Text(user.password)),
                    // DataCell(IconButton(
                    //   icon: Icon(Icons.remove, color: Colors.red,),
                    //   onPressed: () => _removeUser(widget.persons.indexOf(user)),
                    // )),
                  ],
                );
              }).toList(),
            ));

  }
}