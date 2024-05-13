import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransferOwnershipScreen extends StatefulWidget {
  final List<TransferOwner> transfer_land;
  const TransferOwnershipScreen({super.key, required this.transfer_land});

  @override
  State<TransferOwnershipScreen> createState() => _TransferOwnershipScreenState();
}

class _TransferOwnershipScreenState extends State<TransferOwnershipScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    Text("LAND ID",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
                DataColumn(
                    label:
                    Text("BUYER NAME",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
                DataColumn(
                    label:
                    Text("SELLER NAME",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
                DataColumn(
                    label:
                    Text("STATUS",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),

              ],
              rows: widget.transfer_land.map((transfer) {
                return DataRow(

                  cells: <DataCell>[
                    DataCell(Text(transfer.landId,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500,fontSize: 20,fontStyle: FontStyle.italic),)),
                    DataCell(Text(transfer.buyerName,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500,fontSize: 20,fontStyle: FontStyle.italic),)),
                    DataCell(Text(transfer.sellerName,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500,fontSize: 20,fontStyle: FontStyle.italic),)),
                    DataCell(Text(transfer.status,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500,fontSize: 20,fontStyle: FontStyle.italic),)),

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
class TransferOwner {
  String landId;
  String buyerName;
  String sellerName;
  String status;

  TransferOwner({required this.landId, required this.buyerName, required this.sellerName,required this.status});
}
