import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Widgets/header.dart';
import '../../Widgets/homePageDecription.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:Color(0xFFCDA379),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Top Header
            Material(
              color: Color(0xFFCDA379),
              elevation: 0,
              child: Padding(
                  padding: EdgeInsets.only(
                      left: 150.0, top: 15, right: 50, bottom: 0),
                  child: Column(
                    children: <Widget>[
                      HeaderWidget(),
                    ],
                  )

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10, right: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[


                  Image.asset(
                    'assets/IMG-20240310-WA0042.jpg',
                    height: 600,
                    width: 700,
                  ),
                  LeftDescription(),


                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),

            const SizedBox(
              height: 100,
            ),
          ],
        ),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
