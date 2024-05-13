import 'package:flutter/material.dart';

class Land {
  double metersPrice;
  String owner;

  Land({required this.metersPrice, required this.owner});
}

class MyLandScreen extends StatelessWidget {
  final Land? land;

  MyLandScreen({required this.land});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCDA379),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("My Land ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.photo,
              size: 150.0,
              color: Colors.grey,
            ),
            SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meters Price: \$${land?.metersPrice.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Owner: ${land?.owner}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

