import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../../../../../Widgets/round_button.dart';
import '../../../../../constants/app_color.dart';
import '../GetAllLandInspector/all_land_inspectors.dart';



class AddLandInspector extends StatefulWidget {
  const AddLandInspector({super.key});

  @override
  State<AddLandInspector> createState() => _AddLandInspectorState();
}

class _AddLandInspectorState extends State<AddLandInspector> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _textFieldController = TextEditingController();

  void _printText() {
    String text = _textFieldController.text;
    print(text);
  }

  Future<void> _createUser() async {
    final url = 'http://localhost/block_backend/public/inspector'; // Replace with your API endpoint

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'fullName': _fullNameController.text,
          'address': _addressController.text,
          'age': _ageController.text,
          'phone': _phoneController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
        },
      );

      if (response.statusCode == 201) {
        print(response.statusCode);
        // User created successfully
        // You can perform any additional actions here, such as showing a success message
      } else {
        print(response.statusCode);
        // Error occurred while creating the user
        // You can handle the error as per your requirement
      }
    } catch (e) {
      print("http error");

      // Exception occurred during the HTTP request
      // Handle the exception here, such as displaying an error message
      print('Exception occurred: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCDA379),
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.black,
      //   title: Text("Add Land Inspector",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      // ),
      body: SafeArea(
          child:
          Stack(
            alignment: AlignmentDirectional.center,
            children: [

              Positioned(
                top: 50,
                child: main_container(),
              )
            ],
          )
      ),
    );
  }

  Container main_container() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.border.withOpacity(0.15),
        ),
        color: AppColor.gray60.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 550,
      width: 540,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(

              controller: _fullNameController,
              cursorColor: AppColor.primarySoft,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9)),
              decoration: InputDecoration(

                contentPadding: EdgeInsets.symmetric(
                    horizontal: 15, vertical: 15),
                labelText: 'Full Name',
                labelStyle: TextStyle(fontSize: 17, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Colors.black)),
              ),

            ),
          ),
          const SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              // focusNode: ex,
              controller: _addressController,
              cursorColor: AppColor.primarySoft,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9)),
              decoration: InputDecoration(

                contentPadding: EdgeInsets.symmetric(
                    horizontal: 15, vertical: 15),
                labelText: 'Address',
                labelStyle: TextStyle(fontSize: 17, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Colors.black)),
              ),

            ),
          ),
          const SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              // focusNode: ex,
              controller: _ageController,
              cursorColor: AppColor.primarySoft,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9)),
              decoration: InputDecoration(

                contentPadding: EdgeInsets.symmetric(
                    horizontal: 15, vertical: 15),
                labelText: 'Age',
                labelStyle: TextStyle(fontSize: 17, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Colors.black)),
              ),

            ),
          ),
          const SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              // focusNode: ex,
              controller: _phoneController,
              cursorColor: AppColor.primarySoft,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9)),
              decoration: InputDecoration(

                contentPadding: EdgeInsets.symmetric(
                    horizontal: 15, vertical: 15),
                labelText: 'Phone',
                labelStyle: TextStyle(fontSize: 17, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Colors.black)),
              ),

            ),
          ),

          const SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              // focusNode: ex,
              controller: _emailController,
              cursorColor: AppColor.primarySoft,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9)),
              decoration: InputDecoration(

                contentPadding: EdgeInsets.symmetric(
                    horizontal: 15, vertical: 15),
                labelText: 'Email',
                labelStyle: TextStyle(fontSize: 17, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Colors.black)),
              ),

            ),
          ),
          const SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              // focusNode: ex,
              controller: _passwordController,
              cursorColor: AppColor.primarySoft,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9)),
              decoration: InputDecoration(

                contentPadding: EdgeInsets.symmetric(
                    horizontal: 15, vertical: 15),
                labelText: 'Password',
                labelStyle: TextStyle(fontSize: 17, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Colors.black)),
              ),

            ),
          ),
          const SizedBox(height: 20,),
          CustomRoundButton(label: 'Add Inspector', onTap: _createUser,)

        ],
      ),
    );
  }
}
class Person {
  String name;
  String address;
  String city;

  Person({required this.name, required this.address, required this.city});
}


