import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_TextField.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          width: 590,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            //color: Color(0xFFBb3b3cc),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

                   Row(
                children: const [
                  Text(
                    'Verified',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  Icon(
                    Icons.verified,
                    color: Colors.green,
                  )
                ],
              ),
                  const  Text(
                'Not Yet Verified',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
               CustomTextField(text: 'Wallet', label: 'Address', ),
               CustomTextField(text: 'Enter Your Name Here ', label: 'Name', ),
               CustomTextField(text: 'Enter Your Age Here ', label: 'Age', ),
               CustomTextField(text: 'Enter Your City Here ', label: 'City', ),

              TextButton(
                onPressed: () {
                  // launchUrl(userInfo[6].toString());
                },
                child: const Text(
                  '  View Document',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              CustomTextField(text: 'Mail', label: '', ),
            ],
          ),
        ),
      ),
    );
  }
}
