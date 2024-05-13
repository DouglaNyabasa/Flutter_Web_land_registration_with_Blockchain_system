import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySenRequestScreen extends StatefulWidget {
  final List<LandReceivedRequest> requested_lands;
  const MySenRequestScreen({super.key, required this.requested_lands});

  @override
  State<MySenRequestScreen> createState() => _MySenRequestScreenState();
}

class _MySenRequestScreenState extends State<MySenRequestScreen> {
  // TODO : CREATE THE METHOD TO ACCEPT LAND REQUEST
  void _accept(int index) {
    setState(() {
      widget.requested_lands.removeAt(index);
    });
  }
  // TODO : CREATE THE METHOD TO REJECT LAND REQUEST
  void _reject(int index) {
    setState(() {
      widget.requested_lands.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCDA379),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("User DashBoard",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          children: [
            DataTable(
              columns: [
                DataColumn(
                    label:
                    Text("LAND ID",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
                DataColumn(
                    label:
                    Text("BUYER NAME",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
                DataColumn(
                    label:
                    Text("PAYMENT DONE",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
                DataColumn(
                    label:
                    Text("ACCEPT",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
                DataColumn(
                    label:
                    Text("REJECT",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
               
              ],
              rows: widget.requested_lands.map((land) {
                return DataRow(

                  cells: <DataCell>[
                    DataCell(Text(land.landId,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500,fontSize: 20,fontStyle: FontStyle.italic),)),
                    DataCell(Text(land.buyerName,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500,fontSize: 20,fontStyle: FontStyle.italic),)),
                    DataCell(Text(land.paymentDone,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500,fontSize: 20,fontStyle: FontStyle.italic),)),
                    DataCell(TextButton(
                      child: Text("Accept",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      onPressed: () => _accept(widget.requested_lands.indexOf(land)),
                    )),
                    DataCell(TextButton(
                      child: Text("Reject",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      onPressed: () => _reject(widget.requested_lands.indexOf(land)),
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
class LandReceivedRequest {
  String landId;
  String buyerName;
  String paymentDone;



  LandReceivedRequest({required this.landId, required this.buyerName, required this.paymentDone });
}
