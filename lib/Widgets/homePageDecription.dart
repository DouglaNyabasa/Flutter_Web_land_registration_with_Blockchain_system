import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:universal_html/html.dart' as html;


class LeftDescription extends StatelessWidget {
  const LeftDescription({Key? key}) : super(key: key);
  static final appContainer = kIsWeb
      ? html.window.document.querySelectorAll('flt-glass-pane')[0]
      : null;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end
      ,
      children: <Widget>[
        // title
        const FittedBox(
          child: Text('\"Building Trust,\n One Block at a Time\n Land Registry on Blockchain\"',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xff28313b),
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                //letterSpacing: 1.5,
              )),
        ),
        // Description

      ],
    );
  }
}
