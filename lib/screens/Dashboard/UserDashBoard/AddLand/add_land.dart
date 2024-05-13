import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../Widgets/round_button.dart';
import '../../../../constants/app_color.dart';


class AddLandScreen extends StatefulWidget {
  const AddLandScreen({super.key});

  @override
  State<AddLandScreen> createState() => _AddLandScreenState();
}

class _AddLandScreenState extends State<AddLandScreen> {

  String? _filePath;

  Future<void> _selectDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path!;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCDA379),
      appBar: AppBar(
        backgroundColor: Color(0xFFCDA379),
        centerTitle: true,
        title: Text("Add Land ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(
          child:
          Stack(
            alignment: AlignmentDirectional.center,
            children: [

              Positioned(
                top: 40,
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
      height:550 ,
      width: 540,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              // focusNode: ex,
              // controller: explain_c,
              cursorColor: AppColor.primarySoft,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9)),
              decoration: InputDecoration(

                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                labelText: 'Area(SqFt)',
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
              // controller: explain_c,
              cursorColor: AppColor.primarySoft,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9)),
              decoration: InputDecoration(

                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
              // controller: explain_c,
              cursorColor: AppColor.primarySoft,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9)),
              decoration: InputDecoration(

                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                labelText: 'Land Price',
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
              // controller: explain_c,
              cursorColor: AppColor.primarySoft,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9)),
              decoration: InputDecoration(

                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                labelText: 'PID',
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
              // controller: explain_c,
              cursorColor: AppColor.primarySoft,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9)),
              decoration: InputDecoration(

                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                labelText: 'Survey No',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _selectDocument,
                child: Text('Upload Land Document'),
              ),
              // SizedBox(height: 16.0),
              // Text(
              //   'Selected document: ${_filePath ?? 'No document selected'}',
              //   style: TextStyle(fontSize: 16.0),
              // ),
            ],
          ),
          const SizedBox(height: 20,),
          CustomRoundButton(label: 'Add Land', onTap: () {  },)

        ],
      ),
    );
  }
}
class Land {
  String owner;
  String price;
  String metres;
  String surveyNumber;
  Document document;

  Land({required this.owner, required this.price, required this.metres,required this.surveyNumber, required this.document, });
}
