import 'package:flutter/cupertino.dart';





class LogInHeader extends StatelessWidget {
  const LogInHeader({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 260,
          width: 350,
          image: AssetImage("assets/computer-security-with-login-password-padlock.jpg"),
        ),

      ],
    );
  }
}