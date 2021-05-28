import 'package:book_rent_5_3/Welcome/Onboard.dart';
import 'package:book_rent_5_3/src/authentication.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

class SignoutButton extends StatefulWidget {
  @override
  _SignoutButtonState createState() => _SignoutButtonState();
}

class _SignoutButtonState extends State<SignoutButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      // color: kPaleBlue,
      // borderRadius: BorderRadius.circular(size.height * 0.05),
      child: TextButton(
        onPressed: () async {
          await signOutGoogle().then((result) {
            print(result);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Onboard()),
            );
          });
        },
        child: Text(
          "Гарах",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kDarkBlue,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
