import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLand extends StatelessWidget {
  const MyLand({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFCDA379),
      appBar: AppBar(
        title: const Text('Land Details'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),

              const SizedBox(
                height: 10,
              ),
              const Center(
                  child: Text('Details',
                      style:
                      TextStyle(fontSize: 35, color: Colors.blueAccent))),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(width: 700, child: Divider()),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 700,
                child: Table(
                  columnWidths: const {
                    0: FractionColumnWidth(0.3),
                    1: FractionColumnWidth(0.7)
                  },
                  children: [
                    TableRow(children: [
                      const Text(
                        "Area : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      // Text(widget.landinfo.area,
                      //     style: const TextStyle(fontSize: 20))
                    ]),
                    const TableRow(children: [
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ]),
                    TableRow(children: [
                      const Text(
                        "Owner Address : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      // Text(widget.landinfo.ownerAddress,
                      //     style: const TextStyle(fontSize: 20))
                    ]),
                    const TableRow(children: [
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ]),
                    TableRow(children: [
                      const Text(
                        "Address : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      // Text(widget.landinfo.landAddress,
                      //     style: const TextStyle(fontSize: 20))
                    ]),
                    const TableRow(children: [
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ]),
                    TableRow(children: [
                      const Text(
                        "Price : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      // Text(widget.landinfo.landPrice,
                      //     style: const TextStyle(fontSize: 20))
                    ]),
                    const TableRow(children: [
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ]),
                    TableRow(children: [
                      const Text(
                        "Survey Number : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      // Text(widget.landinfo.physicalSurveyNumber,
                      //     style: const TextStyle(fontSize: 20))
                    ]),
                    const TableRow(children: [
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ]),
                    TableRow(children: [
                      const Text(
                        "Property Id : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      // Text(widget.landinfo.propertyPID,
                      //     style: const TextStyle(fontSize: 20))
                    ]),
                    const TableRow(children: [
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ]),
                    TableRow(children: [
                      const Text(
                        "Document : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      MaterialButton(
                        onPressed: () {
                          // launchUrl(widget.landinfo.document);
                        },
                        child: const Text('View',
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      )
                    ]),
                    const TableRow(children: [
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ])
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class LandInfo {
  final String area;
  final String landAddress;
  final String landPrice;
  //string allLongitude;
  final String propertyPID;
  final String physicalSurveyNumber;
  final String document;
  final bool isforSell;
  final String ownerAddress;
  final bool isLandVerified;

  LandInfo(
      this.area,
      this.landAddress,
      this.landPrice,
      this.propertyPID,
      this.physicalSurveyNumber,
      this.document,
      this.isforSell,
      this.ownerAddress,
      this.isLandVerified);
}
