import 'package:flutter/cupertino.dart';

import '../constants/app_color.dart';


class CustomRoundButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const CustomRoundButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.backgroundColorDark
        ),
        child: Center(
          child: Text(label,
            style: TextStyle(
              color: AppColor.primarySoft
            ),
          ),
        ) ,
      ),

    );
  }
}
