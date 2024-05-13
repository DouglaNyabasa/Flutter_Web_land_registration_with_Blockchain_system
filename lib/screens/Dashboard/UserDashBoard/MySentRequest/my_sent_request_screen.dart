import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySentRequestScreen extends StatefulWidget {
  final List<LandSendRequest> requested_lands;
  const MySentRequestScreen({super.key, required this.requested_lands});

  @override
  State<MySentRequestScreen> createState() => _MySentRequestScreenState();
}

class _MySentRequestScreenState extends State<MySentRequestScreen> {
  // TODO : CREATE THE METHOD TO ACCEPT LAND REQUEST
  void _makePayment(int index) {
    setState(() {
      widget.requested_lands.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    Text("OWNER ADDRESS",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
                DataColumn(
                    label:
                    Text("STATUS",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
                DataColumn(
                    label:
                    Text("PRICE",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
                DataColumn(
                    label:
                    Text("MAKE PAYMENT",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),

              ],
              rows: widget.requested_lands.map((land) {
                return DataRow(

                  cells: <DataCell>[
                    DataCell(Text(land.landId,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500,fontSize: 20,fontStyle: FontStyle.italic),)),
                    DataCell(Text(land.buyerName,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500,fontSize: 20,fontStyle: FontStyle.italic),)),
                    DataCell(Text(land.paymentDone,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500,fontSize: 20,fontStyle: FontStyle.italic),)),
                    DataCell(TextButton(
                      child: Text("Pay now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      onPressed: () => _makePayment(widget.requested_lands.indexOf(land)),
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
class LandSendRequest {
  String landId;
  String buyerName;
  String paymentDone;



  LandSendRequest({required this.landId, required this.buyerName, required this.paymentDone });
}