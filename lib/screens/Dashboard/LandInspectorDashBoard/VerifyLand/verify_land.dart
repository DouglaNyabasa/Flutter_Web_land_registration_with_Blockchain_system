import 'package:blockchain_landregistry1/screens/Dashboard/UserDashBoard/AddLand/add_land.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyLandScreen extends StatefulWidget {
  final List<Land> lands;
  const VerifyLandScreen({super.key, required this.lands});

  @override
  State<VerifyLandScreen> createState() => _VerifyLandScreenState();
}


class _VerifyLandScreenState extends State<VerifyLandScreen> {

  // TODO : CREATE THE METHOD TO VERIFY LAND
  void _verifyland(int index) {
    setState(() {
      widget.lands.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCDA379),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Land Inspector DashBoard",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          children: [
            DataTable(
              columns: [
                DataColumn(
                    label:
                    Text("LAND OWNER NAME",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
                DataColumn(
                    label:
                    Text("AREA",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
                DataColumn(
                    label:
                    Text("PRICE",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
                DataColumn(
                    label:
                    Text("SURVEY NUMBER",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
                DataColumn(
                    label:
                    Text("LAND DOCUMENT",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
                DataColumn(
                    label:
                    Text("VERIFY",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
              ],
              rows: widget.lands.map((land) {
                return DataRow(

                  cells: <DataCell>[
                    DataCell(Text(land.owner,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500,fontSize: 20,fontStyle: FontStyle.italic),)),
                    DataCell(Text(land.metres,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500,fontSize: 20,fontStyle: FontStyle.italic),)),
                    DataCell(Text(land.price,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500,fontSize: 20,fontStyle: FontStyle.italic),)),
                    DataCell(Text(land.surveyNumber,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500,fontSize: 20,fontStyle: FontStyle.italic),)),
                    DataCell(Text(land.document as String,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500,fontSize: 20,fontStyle: FontStyle.italic),)),
                    DataCell(TextButton(
                      child: Text("Verify Land",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      onPressed: () => _verifyland(widget.lands.indexOf(land)),
                    )),
                  ],
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
